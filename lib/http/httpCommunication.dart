import 'package:flutterman/http/githubRepos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutterman/http/post.dart';

class HttpCommunication {
  Future<Post> fetchTestData(url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data!");
    }
  }

  Future<ReposList> fetchGithubData(url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var repos = ReposList.fromJson(jsonDecode(response.body));
      return repos;
    } else {
      throw Exception("Failed to load data!");
    }
  }
}