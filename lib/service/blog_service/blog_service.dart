import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BlogService {
  Future<dynamic> selectAllBlog() async {
    dynamic response;
    try {
      response =
          await Dio().get('http://127.0.0.1:8080/backend_blog/selectAllBlog');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response;
  }
}
