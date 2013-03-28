# Computer: Tell Me What to Read

I have too many things to read. I've got a stack of eighteen books on my desk and an Amazon wish list twice that length; I've got 345 long articles saved to Instapaper; I've got an RSS reader with 6,000 items, most of them meaty blog posts.

It's at the point where I'm not really doing much reading, because there's too much reading to do. My queues are overwhelming. There are too many sources. And what's happened is sort of like what happens over time to a box full of crap: the big stuff sinks slowly out of sight. I spend more time reading little trinkets -- the news, HN, twitter -- and almost no time at all with books, essays, poems, papers.

I've long wanted something like what the President gets every morning: a dossier with everything I'm supposed to read today. Ray Bradbury once [advised](http://www.openculture.com/2012/04/ray_bradbury_gives_12_pieces_of_writing_advice_to_young_authors_2001.html) young writers to "stuff their heads" with one short story, one poem, and one essay each night. "These essays should come from a diversity of fields, including archaeology, zoology, biology, philosophy, politics, and literature... At the end of a thousand nights," he said, "Jesus God, you’ll be full of stuff!"

The trouble is that I'm too lazy -- not too lazy to read, since reading is, [in its own way](http://jsomers.net/notes/single.php?id=527), a fairly passive way to use a mind -- but too lazy to *set up* such an eclectic collection. In fact more than a year ago in a [blog post](http://jsomers.net/blog/deskotron) I imagined a program called `deskotron` that would do it for me:

> The first thing that `deskotron` would do is catalog everything I want or ought to do. By this I mean he would keep track of every book, blog post, paper, essay, and article I should read; every errand I have to run; every work to-do; every side project I’ve got going or have said I’d start; every puzzle or problem I would like to solve; every game I enjoy playing; all of my appointments; every essay I should write; all of my e-mails and calls; every movie, TED talk, and stupid video I plan to watch; etc. In short, deskotron would create a massive database of activity-units-I-could-fill-my-day-with, or *tasklets*.

The idea being that the best way to get a lot of things done is to get *one* thing done, and the best way to do that is to lower its "activation energy." So that's what `deskotron` does: it decides what you should do and it puts the damn thing in front of you.

That might help explain why I'm calling the attached script **deskotron.rb**. Here's how it works:

1. Like I said, I have a bunch of sources of stuff-to-read. The two sources I care most about, since they make for the best reading, are (a) my Instapaper queue, which is rich and full, and (b) my stack of books. The stack of books is where things get interesting.

2. I've always been [obsessed](http://jsomers.net/blog/open-books) by the idea of making books easily accessible. Even since that post things have gotten better. We live in an age now when most books we'd like to read are *e*books, and most ebooks can be trivially un-DRMed.

3. So that's what I do: I take a book I'd like to read, say, George Saunders's new *The Tenth of December* -- which I bought, by the way -- and I un-DRM it. I *serialize* it: I turn the ebook into an HTML file and I split that HTML file into chapters. (Or if it's an anthology of poems, I might cut by author. If it's an encyclopedia, I cut at each entry. Etc.)

4. Every day I run a script at 5am (roughly when the President wakes up). The goal of this script is to fill a special Instapaper folder of mine that comprises the day's reading. I allot it some number of target words, say, **5,000**.

5. To fill the allotment, I (a) sample articles from my main Instapaper queue, and (b) sample chapters from my books.

6. In the time it takes me to get from my apartment to the subway for my morning commute -- which is about a two-minute walk -- Instapaper, with its fancy geofencing capability, will have downloaded my dossier for the day.
