# Computer: Tell Me What to Read

I have too many things to read. I've got a stack of eighteen books on my desk and an Amazon wish list twice that length; I've got 345 long articles saved to Instapaper; I've got an RSS reader with 6,000 items, most of them meaty blog posts.

It's at the point where I'm not really doing much reading, because there's too much reading to do. My queues are overwhelming. There are too many sources. And what's happened is sort of like what happens over time to a box full of crap: the big stuff sinks slowly out of sight. I spend more time reading little trinkets -- the news, HN, twitter -- and almost no time at all with books, essays, poems, papers.

I've long wanted something like what the President gets every morning: a dossier with everything I'm supposed to read that day. Ray Bradbury once [advised](http://www.openculture.com/2012/04/ray_bradbury_gives_12_pieces_of_writing_advice_to_young_authors_2001.html) young writers to "stuff their heads" with one short story, one poem, and one essay each night. "These essays should come from a diversity of fields, including archaeology, zoology, biology, philosophy, politics, and literature... At the end of a thousand nights," he said, "Jesus God, you’ll be full of stuff!"

The trouble is that I have a hard time doing things that aren't top of mind. I once even imagined a computer program that would prioritize and prepare tasks for me. I called it [deskotron](http://jsomers.net/blog/deskotron):

> The first thing that `deskotron` would do is catalog everything I want or ought to do. By this I mean he would keep track of every book, blog post, paper, essay, and article I should read; every errand I have to run; every work to-do; every side project I’ve got going or have said I’d start; every puzzle or problem I would like to solve; every game I enjoy playing; all of my appointments; every essay I should write; all of my e-mails and calls; every movie, TED talk, and stupid video I plan to watch; etc. In short, deskotron would create a massive database of activity-units-I-could-fill-my-day-with, or *tasklets*.

The idea is that the hardest part of doing stuff is getting started. So the goal of `deskotron` is to lower a "tasklet's" activation energy: to decide what you should do and put the damn thing in front of you.

You can see why I've called the attached script **deskotron.rb**. It's my first modest crack at building a system I've long imagined. Here's how it works:

1. I define sources of stuff-to-read. The two sources I started with, since they make for the best reading, are my Instapaper queue and my stack of books.

2. I've always been [obsessed](http://jsomers.net/blog/open-books) by the idea of making books easily accessible. And the great thing is that most of the books you'd want to read now are digitized, and a digitized book can be parsed and processed.

3. So I take a book that I'd like to read, say, George Saunders's new *The Tenth of December* -- which I bought, by the way -- and I un-DRM it. I *serialize* it: I turn the ebook into an HTML file and I split that HTML file into chapters. (Or if it's an anthology of poems, I might cut the anthology up by author. If it's an encyclopedia, I might cut at each entry.)

4. Every day I run a script at 5am (roughly when the President wakes up). The goal of this script is to fill a special Instapaper folder of mine that comprises the day's reading. I allot it some number of target words, say, **5,000**.

5. To fill the allotment, I sample from my sources. Right now *I* decide how to allot words to each source, but in the future, `deskotron` will make that decision for me: maybe 2,000 words from Instapaper, 2,000 words of Montaigne, a 500-word poem, etc.

6. In the time it takes me to get from my apartment to the subway for my morning commute -- which is about a two-minute walk -- Instapaper, with its fancy [geofencing capability](http://blog.instapaper.com/post/24293729146), downloads my dossier for the day.
