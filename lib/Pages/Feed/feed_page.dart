import 'package:flutter/material.dart';
import 'package:journalia/Widgets/drawer.dart';
import 'package:logger/logger.dart';
import '../../Widgets/bottom_nav_bar.dart';
import '../../colors.dart';
import 'package:journalia/Models/article_box.dart';
import '../../Widgets/base_scaffold.dart';
import '../../dummy_data.dart';
import 'article_card.dart';
import 'package:journalia/constants.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  int currentTopicIndex = 0;
  Logger logger = Logger();
  List<ArticleBox> currentArticles = []; // Updated to store fetched articles
  List<ArticleBox> allArticles = []; // Store all articles for search
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchArticlesForCurrentTopic(); // Fetch articles when the page initializes

    // Add a listener to the search controller
    searchController.addListener(() {
      search(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void fetchArticlesForCurrentTopic() async {
    try {
      List<ArticleBox> fetchedArticles =
          generateDummyArticles(currentTopicIndex);

      setState(() {
        allArticles = fetchedArticles; // Store all fetched articles
        currentArticles = fetchedArticles; // Initially display all articles
      });
    } catch (e) {
      logger.e('Error fetching articles: $e');
      // Handle error (e.g., show error message to the user)
    }
  }

  void search(String query) {
    final results = allArticles.where((article) {
      final titleLower = article.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      currentArticles = results;
    });
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
      body: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        drawer: const CustomDrawer(),
        backgroundColor: Colors.transparent,
        appBar: buildAppBar2(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryTextColor),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: TextField(
                    cursorColor: primaryTextColor,
                    style: const TextStyle(color: primaryTextColor),
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: primaryTextColor),
                      prefixIcon: const Icon(Icons.search, color: primaryTextColor),
                      filled: false,
                      fillColor: accentColor.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                              color: primaryTextColor,
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
                              color: primaryTextColor),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        IconButton(
                          icon: const Icon(Icons.double_arrow, color: primaryTextColor),
                          onPressed: _nextTopic,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: primaryTextColor),
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
        ),
      ),
    );
  }
}
