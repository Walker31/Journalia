// feed_page.dart
import 'package:flutter/material.dart';
import 'package:journalia/Widgets/header.dart';
import 'package:logger/logger.dart';
import '../../Backend/data.dart';
import '../../colors.dart';
import 'package:journalia/Models/article_box.dart';
import '../../Widgets/base_scaffold.dart';
import '../../dummy_data.dart';
import 'article_card.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  int currentTopicIndex = 0;
  Logger logger = Logger();
  List<ArticleBox> currentArticles = generateDummyArticles(); // Updated to store fetched articles

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

  @override
  void initState() {
    super.initState();
    fetchArticlesForCurrentTopic(); // Fetch articles when the page initializes
  }

  void fetchArticlesForCurrentTopic() async {
    try {
      List<ArticleBox> fetchedArticles =
          await fetchArticleBoxesByTopicId(currentTopicIndex + 1); // +1 because topicId starts from 1

      setState(() {
        currentArticles = fetchedArticles;
      });
    } catch (e) {
      logger.e('Error fetching articles: $e');
      // Handle error (e.g., show error message to the user)
    }
  }

  void _nextTopic() {
    setState(() {
      currentTopicIndex = (currentTopicIndex + 1) % topics.length;
      fetchArticlesForCurrentTopic(); // Fetch articles when topic changes
    });
  }

  void _previousTopic() {
    setState(() {
      currentTopicIndex =
          (currentTopicIndex - 1 + topics.length) % topics.length;
      fetchArticlesForCurrentTopic(); // Fetch articles when topic changes
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTopic = topics[currentTopicIndex];

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
                  borderSide:
                      const BorderSide(color: Colors.white, width: 6.0),
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
            ),
          ),
          Expanded(
            child: currentArticles.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(), // Show loading indicator
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
