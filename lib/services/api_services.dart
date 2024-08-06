import 'package:http/http.dart' as http;
import 'package:task8_advanced_api/models/comment_model.dart';
import 'package:task8_advanced_api/models/post_model.dart';
import 'dart:convert';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('$url/posts'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<Comment>> getComments(int postId) async {
    final response = await http.get(Uri.parse('$url/posts/$postId/comments'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Comment> comments =
          body.map((dynamic item) => Comment.fromJson(item)).toList();
      return comments;
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
