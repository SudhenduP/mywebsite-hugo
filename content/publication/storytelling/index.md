+++
abstract = "Using the word embedding techniques, we reveal the constructed emotional dependency of female characters on male characters in stories. We call this narrative structure “Cinderella complex,” which assumes that women depend on men in the pursuit of a happy, fulfilling life. Our analysis covers a substantial portion of narratives that shape the modern collective memory, including 7,226 books, 6,087 movie synopses, and 1,109 movie scripts. The “Cinderella complex” is observed to exist widely across periods and contexts, reminding how gender stereotypes are deeply rooted in our society."
authors = ["Huimin Xu", "Zhang Zhang", "Lingfei Wu", "*Cheng-Jun Wang*"]
date = "2019-11-14"
image_preview = ""
math = true
publication_types = ["2"]
publication = "PLOS ONE."
publication_short = "PLoS ONE 14(11): e0225385."
title = "The Cinderella complex: Word embeddings reveal gender stereotypes in movies and books"
url_code = "https://github.com/xuhuimin2017/storyshape/"
url_dataset = "https://github.com/xuhuimin2017/storyshape/"
url_pdf = "https://doi.org/10.1371/journal.pone.0225385"
url_project = "/project/computational-communication/"

highlight = true
featured = true

# Optional featured image (relative to `static/img/` folder).
[header]
image = "headers/story.png"
caption = ""
+++






### Citation

> Xu H, Zhang Z, Wu L*, *Wang C.J.* * (2019) The Cinderella Complex: Word embeddings reveal gender stereotypes in movies and books. PLoS ONE 14(11): e0225385. [doi:10.1371/journal.pone.0225385](https://doi.org/10.1371/journal.pone.0225385)

You can also find the manuscript of arXiv from this link https://arxiv.org/pdf/1811.04599.pdf.

### Data Availability

The data underlying the results presented in the study are available from IMDB website (www.imdb.com), IMSDB website (www.imsdb.com), and the Gutenberg Project (www.gutenberg.org). All the code and processed data are available from https://github.com/xuhuimin2017/storyshape/

### Claims

The rich literature on gender stereotypes points out the assumptions to explore in identifying and quantifying stereotypical narrative structures, including

- 1) The emotional dependency of females on males. Men and women have different social imagines. Men are agentic, and women are communal [19,29,30]; men are active, whereas women are passive; men give, and women take in relationships [29–31]. These biased images of men and women lead to biased expectations in their relationships. Those who consider women less competent would tend to believe that they are fragile and sensitive and need to be protected by men [19,32]. Following this literature, we propose to test the emotional dependency of females on males [33];
- 2) Men act and women appear. The English novelist John Berger [34] used this quote to describe the male-female dichotomy. Considering the stereotypical role and traits of men, one would imagine men are more likely than women to be described using verbs;
- 3) Social endorsement of gender stereotypes. The social and cultural roots of gender stereotypes form social force against stereotype disconfirmation from people, action, or ideas [19]. In this sense, the stories that approve gender stereotypes will gain social approval themselves, whereas the stories against stereotypes will be ignored and disapproved. Our study will test this assumption by connecting the frame of stories with their social acceptance.

> We firstly construct a vector representing the dimension of happy versus unhappy from pre-trained word vectors using Google News data [17]. The distance from this vector to other word vectors represents the “happiness score” of the corresponding words. The average of “happiness scores” over the timeline of stories quantifies their shape. Moreover, by controlling the window size to analyze only the words surrounding specific names, we can track the “happiness scores” of different characters. Using these techniques, we find that in the movie synopsis of Cinderella, the happiness of Ella (Cinderella) depends on Kit (Prince) but not vice versa. This finding supports the “Cinderella complex” [18], a narrative structure enhancing the stereotypical incompetence of women. Applying our analysis to 6,087 movie synopses, 1,109 movie scripts, and 7,226 books, we observe the vast existence of this narrative structure. Our review of the words surrounding characters unpack their stereotypical life packages; the lives of males are adventure-oriented, whereas the lives of females are romantic-relationship oriented. Finally, we reveal the social endorsement of gender stereotypes by identifying the association between the strength of gender stereotypes in movie synopses and the IMDB ratings to the analyzed movies.

![](/img/2019/journal.pone.0225385.g001.PNG)

Fig 1. The Cinderella complex. a, Visualizing the sentiment landscape of the movie synopsis of Cinderella as a skyline (a black outline is added to enhance the “skyline”metaphor visually). We show sentences in a vertical schema, colored by their “happiness score”—green for happy and red for unhappy and the transparency represents the scale of the scores. Filled squares (orange for Ella and blue for Kit) indicate the co-occurrence of Ella (Cinderella) and Kit (the Prince) in the same sentence. Hollow squares indicate where only one character appears: b, The happiness curves of Ella (orange) and Kit (blue). The grey dotted lines marks the sentences in which they co-occur, corresponding to the filled squares in Panel a. We fit the increase or decrease in happiness scores across successive co-occurrences with OLS regression (see Methods for more information). Thick lines show the estimates of regression.

Our analysis of the words surrounding female and male characters shows that the lives of males are adventure-oriented, whereas the lives of females are romantic-relationship oriented. Finally, we demonstrate the social endorsement of gender stereotypes by showing that gender-stereotypical movies are voted more frequently and rated higher.
