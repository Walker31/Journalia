import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:journalia/Models/votes.dart';
import 'package:journalia/models/article.dart';
import 'package:journalia/models/comments.dart';
import 'package:logger/logger.dart';
import '../Models/article_box.dart';
import '../Models/users.dart';


const String baseUrl = 'http://localhost:3000';

// Function to fetch articles by topic ID and create ArticleBox instances
Future<List<ArticleBox>> fetchArticleBoxesByTopicId(int topicId) async {
  Logger logger = Logger();
  final response = await http
      .get(Uri.parse('$baseUrl/articles?topic_id=$topicId'));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<Articles> articles =
        body.map((dynamic item) => Articles.fromJson(item)).toList();

    List<ArticleBox> articleBoxes = [];

    // Fetching votes and comments for each article
    for (var article in articles) {
      try {
        List<Vote> votes = await fetchVotesByArticleId(article.articleId);
        List<Comments> comments =
            await fetchCommentsByArticleId(article.articleId);

        // Calculate upvotes and downvotes based on voteType
        int upVotes = votes.where((vote) => vote.voteType == 1).length;
        int downVotes = votes.where((vote) => vote.voteType == 0).length;

        // Map comments to List<String>
        List<String> commentContents =
            comments.map((comment) => comment.content).toList();
        String author = fetchAuthorNameByWriterId(article.articleId) as String;
        String title = "";

        // Create ArticleBox instance
        ArticleBox articleBox = ArticleBox(
          title: title, // Assuming this represents the article title
          author: author, // Assuming this represents the author's name or ID
          content:
              article.content, // Assuming this represents the article content
          upVotes: upVotes,
          downVotes: downVotes,
          comments: commentContents,
        );

        // Add ArticleBox to the list
        articleBoxes.add(articleBox);
      } catch (e) {
        // Handle error fetching votes or comments for an article
        logger.e('Error fetching details for article ${article.articleId}: $e');
      }
    }

    return articleBoxes;
  } else {
    throw Exception('Failed to load articles');
  }
}

// Function to fetch votes by article ID
Future<List<Vote>> fetchVotesByArticleId(int articleId) async {
  final response = await http
      .get(Uri.parse('$baseUrl/votes?article_id=$articleId'));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<Vote> votes =
        body.map((dynamic item) => Vote.fromJson(item)).toList();
    return votes;
  } else {
    throw Exception('Failed to load votes for article $articleId');
  }
}

// Function to fetch comments by article ID
Future<List<Comments>> fetchCommentsByArticleId(int articleId) async {
  final response = await http
      .get(Uri.parse('$baseUrl/comments?article_id=$articleId'));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<Comments> comments =
        body.map((dynamic item) => Comments.fromJson(item)).toList();
    return comments;
  } else {
    throw Exception('Failed to load comments for article $articleId');
  }
}

Future<String> fetchAuthorNameByWriterId(int writerId) async {
  final response =
      await http.get(Uri.parse('$baseUrl/users?user_id=$writerId'));

  if (response.statusCode == 200) {
    Map<String, dynamic> userData = jsonDecode(response.body);
    User author = User.fromJson(userData);
    return author.userName;
  } else {
    throw Exception('Failed to load author');
  }
}
