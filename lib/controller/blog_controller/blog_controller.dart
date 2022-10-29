import 'package:dio/dio.dart';
import 'package:troubleskiller_blog/model/blog_model.dart';
import 'package:troubleskiller_blog/service/blog_service/blog_service.dart';

class BlogController {
  final BlogService _blogService = BlogService();
  Future<List<BlogModel>> selectAllBlog() async {
    List<BlogModel> results = [];
    Response response = await _blogService.selectAllBlog();
    print(response);
    results = BlogJSONModel.fromJson(response.data).result ?? [];
    return results;
  }
}
