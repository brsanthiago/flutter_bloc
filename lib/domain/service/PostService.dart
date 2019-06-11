import 'package:dio/dio.dart';
import 'package:flutter_bloc/domain/model/Post.dart';

class PostService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";
  final Dio _dio = Dio();

  Future<List<Post>> getPosts() async {
    try {
      Response response = await _dio.get(baseUrl);

      List data = response.data as List;

      List<Post> posts = data.map<Post>((post) => Post.fromJson(post)).toList();

      return posts;
    } catch (e) {
      throw Exception(e);
    }
  }
}
