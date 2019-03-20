
import 'package:flutter_bloc_pattern/posts.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Api{

  static const url = 'http://35.154.20.191/wp-json/wp/v2/posts?per_page=100';

  Future<List<Post>> getPost() async {
    List<Post> list = [];

    await get(url)
        .then((res) => res.body)
        .then(json.decode)
        .then((posts) => posts.forEach((post) => list.add(Post.fromJson(post))));

    return list;
  }

}