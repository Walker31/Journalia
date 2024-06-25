import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000'; // Change this to your server's address

  Future<Map<String, dynamic>?> getArticleById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/articles/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getTopicById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/topics/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCommentById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/comments/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getVoteById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/votes/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
