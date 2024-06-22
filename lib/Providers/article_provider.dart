import 'package:flutter/material.dart';
import 'package:journalia/Models/article.dart';

class ArticleProvider extends ChangeNotifier {
  List<Article> _articles = []; // Initial list of articles

  // Method to fetch articles (replace with actual data fetch logic)
  Future<void> fetchArticles() async {
    // Simulate fetching data from API or database
    _articles = [
      Article(
        title: "Sample Article",
        author: "John Doe",
        content: "This is a sample article content.",
        upVotes: 10,
        downVotes: 2,
        comments: [],
      ),
      // Add more articles here
    ];
    notifyListeners(); // Notify listeners after data is updated
  }

  // Getter for articles
  List<Article> get articles => _articles;

  // Method to add new article
  void addArticle(Article article) {
    _articles.add(article);
    notifyListeners(); // Notify listeners after data is updated
  }

  // Method to update existing article
  void updateArticle(Article updatedArticle) {
    // Find and update the article in the list
    final index = _articles.indexWhere((article) => article.title == updatedArticle.title);
    if (index != -1) {
      _articles[index] = updatedArticle;
      notifyListeners(); // Notify listeners after data is updated
    }
  }

  // Method to delete article
  void deleteArticle(Article article) {
    _articles.remove(article);
    notifyListeners(); // Notify listeners after data is updated
  }
}
