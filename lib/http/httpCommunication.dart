import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutterman/http/post.dart';

class HttpCommunication {
  Future<Post> fetchData(url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data!");
    }
  }
}