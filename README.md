# Computer: Tell Me What to Read

I have too many things to read. I've got a stack of eighteen books on my desk and an Amazon wish list twice that length; I've got 345 long articles saved to Instapaper; I've got an RSS reader with 6,000 items, most of them meaty blog posts.

It's at the point where I'm not really doing much reading, because there's too much reading to do. My queues are overwhelming. There are too many sources. And what's happened is sort of like what happens over time to a box full of crap: the big stuff sinks slowly out of sight. I spend more time reading trinkets -- the news, HN, twitter -- and almost no time at all with books, essays, poems, papers.

I've long wanted something like what the President gets every morning: a dossier with everything I'm supposed to read that day. Ray Bradbury once [advised](http://www.openculture.com/2012/04/ray_bradbury_gives_12_pieces_of_writing_advice_to_young_authors_2001.html) young writers to "stuff their heads" with one short story, one poem, and one essay each night. "These essays should come from a diversity of fields, including archaeology, zoology, biology, philosophy, politics, and literature... At the end of a thousand nights," he said, "Jesus God, you’ll be full of stuff!"

The trouble is in making such an eclectic collection available in the first place. I'm simply too lazy to curate a pile of good reading every day. And even if I could come up with the ideal selections -- a little Montaigne and McPhee today, some New Yorker and The Onion tomorrow -- it would seem to require carrying around a knapsack packed with books and magazines.

This is why I'm building "deskotron," a kind of robotic workdesk program that (a) decides what I should read next and (b) puts the damn thing in front of me. Here's how it works:

1. I define sources of stuff-to-read. I've always been [obsessed](http://jsomers.net/blog/open-books) with making books easily accessible, and I know how to turn just about any book in my stack -- say, George Saunders's new *The Tenth of December* -- into a series of well-formatted HTML files, one for each chapter. Same for issues of magazines, or RSS feeds, or the collected works of a single author.

2. Every morning I run **deskotron.rb** at 5am to pull about 7,500 words from these sources, using proportions I define in advance (like "50% from this book, 25% from that one, 25% essays"). The program uses the [Instapaper API](http://www.instapaper.com/api/full) to fill up a special queue just for the day.

3. In the time it takes me to get from my apartment to the subway for my morning commute, Instapaper, with its fancy [geofencing capability](http://blog.instapaper.com/post/24293729146), downloads that day's dossier and transforms it into an easily consumable queue of beautifully formatted text available on my phone, iPad, and computer.

It's like having a very good personal assistant. It's like being the president.
