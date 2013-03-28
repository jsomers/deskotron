#!/Users/jsomers/.rvm/rubies/ruby-1.9.2-p290/bin/ruby
require 'rubygems'
require 'instapaper'
require 'digest/sha1'
require 'pry'

class String
  def word_count
    self.strip.split(/\S+/).size
  end
  
  def chapter_number
    self[/.*?(\d+).*?$/, 1]
  end
end

Instapaper.configure do |config|
  config.consumer_key = ENV['INSTAPAPER_CONSUMER_KEY']
  config.consumer_secret = ENV['INSTAPAPER_CONSUMER_SECRET']
end

tokens = Instapaper.access_token(ENV['INSTAPAPER_LOGIN'], ENV['INSTAPAPER_PASSWORD'])

Instapaper.configure do |config|
  config.oauth_token = tokens["oauth_token"]
  config.oauth_token_secret = tokens["oauth_token_secret"]
end

READ_TODAY_FOLDER_ID = Instapaper.folders.detect {|f| f.title == "Read Today"}.folder_id
WORD_LIMIT = 10_000

# Figure out how many words are already in the "Read Today" list.
def words_currently_in_folder
  bookmarks = Instapaper.bookmarks(folder_id: READ_TODAY_FOLDER_ID)
  bookmarks.inject(0) {|sum, b| sum += Instapaper.text(b["bookmark_id"]).word_count}
end

puts words_currently_in_folder

# Gather words from the current HTML-ized book. Create Instapaper bookmarks from that.
#  
# NB. Process for creating an HTML-ized book:
#
# => Get an ePub or Mobi file.
# => Open it up in Calibre.
# => Add Book, then Convert book, choose HTMLZ as the output format.
# => Go to ~/Calibre Library and find the file.
# => Change its extension to .zip.
# => Move the index.html file to the current_book folder, and split it using the split_book.rb script,
#    which takes a delimiter to split the book on (chapter heading, e.g.).
def add_book_material(word_target)
  words_so_far = 0
  chapters = Dir.glob('/Users/jsomers/Desktop/current_book/chapter_*.html').sort_by {|c| c.chapter_number.to_i }
  raise "The book's done!" if chapters.empty?
  last_file = false

  while !last_file && words_so_far < word_target
    words_to_work_with = word_target - words_so_far
    chapter = chapters.shift
    content = File.open(chapter, "r").read

    if content.word_count > words_to_work_with
      mark = 7 * words_to_work_with
      File.open(chapter, "w") { |f| f.puts "..." + content[mark..-1]}
      content = content[0..mark] + "..."
      last_file = true
    end
  
    puts "Adding #{last_file ? 'truncated' : 'complete'} version of Chapter #{chapter.chapter_number} to Instapaper (#{content.word_count} words)."
    bogus_url = "http://jsomers.net/book-chapter/#{Digest::SHA1.hexdigest(content)}-#{Time.new.to_i}"
    r = Instapaper.add_bookmark(bogus_url, 
      is_private_set_to_source: "Book",
      title: "Chapter #{chapter.chapter_number}",
      folder_id: READ_TODAY_FOLDER_ID,
      content: content)

    raise "Instapaper exception: #{r.inspect}" if r["type"] == "error"
  
    words_so_far += content.word_count
    File.delete(chapter) && (puts "Deleting #{chapter}!") unless last_file
  end
end

def add_instapaper_material(word_target)
  words_so_far = 0
  bookmarks = Instapaper.bookmarks(limit: 500)

  while words_so_far < word_target
    words_to_work_with = word_target - words_so_far
    
    b = bookmarks.sample
    words = Instapaper.text(b["bookmark_id"]).word_count
    puts "Sampled a bookmark, #{b['bookmark_id']}... it's #{words} words."
    
    if (words < words_to_work_with) || (words > words_to_work_with && words < word_target)
      puts "Moving bookmark #{b['title']} (id: #{b['bookmark_id']}) to the Read Today folder."
      r = Instapaper.move(b["bookmark_id"], READ_TODAY_FOLDER_ID)
      raise "Instapaper exception: #{r.inspect}" if r["type"] == "error"
      words_so_far += words
    end
  end
end