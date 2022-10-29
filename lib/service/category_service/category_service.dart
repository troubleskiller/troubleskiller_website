import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CategoryService {
  Future<dynamic> selectAllCategory() async {
    dynamic response;
    try {
      response = await Dio()
          .get('http://127.0.0.1:8080/backend_blog/blog/selectAllCategory');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response;
  }
}
