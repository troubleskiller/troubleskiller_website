import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:troubleskiller_blog/data/common_date.dart';

class BlogService {
  Future<dynamic> selectAllBlog() async {
    dynamic response;
    try {
      response = await Dio().get('$requestUrl/blog/selectAllBlog');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response;
  }
}
