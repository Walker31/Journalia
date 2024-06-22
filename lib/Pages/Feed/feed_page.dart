// feed_page.dart
import 'package:flutter/material.dart';
import 'package:journalia/Widgets/header.dart';
import 'package:logger/logger.dart';
import '../../colors.dart';
import '../../Models/article.dart';
import '../../Widgets/base_scaffold.dart';
import 'article_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  int currentTopicIndex = 0;
  Logger logger = Logger();

  final List<String> topics = [
    "Random",
    "Raising Issues",
    "Resource Sharing",
    "New Initiatives",
    "Clubs",
    "Experience Sharing",
    "Internship",
    "Politics"
  ];

  final Map<String, List<Article>> articles = {
    "Clubs": [
      Article(
          title: "How Bad do you hate your College?",
          author: "Krishna",
          content:
              "Ahh it’s the worst place you can be at, Firstly the climate here is horrible and don’t even get me started at the mess food. The minute you take a bite in, you will feel like puking...",
          upVotes: 345,
          downVotes: 22,
          comments: []),
      // Add more articles for Clubs
    ],
    "Random": [
      Article(
          title: "Upcoming Tech Fest",
          author: "John Doe",
          content:
              "Join us for the annual tech fest with exciting events and competitions...",
          upVotes: 345,
          downVotes: 22,
          comments: []),
      // Add more articles for Events
    ],
    "Resource Sharing": [
      Article(
          title: "Exam Preparation Tips",
          author: "Jane Doe",
          content:
              "Here are some tips to help you prepare for the upcoming exams...",
          upVotes: 345,
          downVotes: 22,
          comments: []),
      // Add more articles for Academics
    ],
    "Sports": [
      Article(
          title: "Inter-College Football Tournament",
          author: "Alex",
          content:
              "Get ready for the inter-college football tournament starting next week...",
          upVotes: 345,
          downVotes: 22,
          comments: []),
      // Add more articles for Sports
    ],
    "Cultural": [
      Article(
          title: "Cultural Fest Highlights",
          author: "Mary",
          content:
              "The cultural fest was a grand success with various performances...",
          upVotes: 345,
          downVotes: 22,
          comments: []),
      // Add more articles for Cultural
    ],
  };

  void _nextTopic() {
    setState(() {
      currentTopicIndex = (currentTopicIndex + 1) % topics.length;
    });
  }

  void _previousTopic() {
    setState(() {
      currentTopicIndex =
          (currentTopicIndex - 1 + topics.length) % topics.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTopic = topics[currentTopicIndex];
    List<Article> currentArticles = articles[currentTopic] ?? [];

    return BaseScaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          CustomHeader(),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: textColor),
                prefixIcon: const Icon(Icons.search, color: textColor),
                filled: true,
                fillColor: accentColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white, width: 6.0),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(" "),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.double_arrow,
                            color: textColor,
                          ),
                        ),
                        onPressed: _previousTopic,
                      ),
                      Text(
                        currentTopic,
                        style: const TextStyle(
                            fontSize: 32,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                      IconButton(
                        icon: const Icon(Icons.double_arrow, color: textColor),
                        onPressed: _nextTopic,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: textColor),
                    onPressed: () {},
                  ),
                ],
              )),
          Expanded(
            child: currentArticles.isEmpty
                ? const Center(
                    child: Text(
                      'No articles found',
                      style: TextStyle(color: textColor, fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: currentArticles.length,
                    itemBuilder: (context, index) {
                      final article = currentArticles[index];
                      return ArticleCard(article: article);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
