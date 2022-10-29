import 'package:dio/dio.dart';
import 'package:troubleskiller_blog/model/category_model.dart';
import 'package:troubleskiller_blog/service/category_service/category_service.dart';

class BlogController {
  final CategoryService _categoryService = CategoryService();
  Future<List<CategoryModel>> selectAllBlog() async {
    List<CategoryModel> results = [];
    Response response = await _categoryService.selectAllCategory();
    print(response);
    results = CategoryJSONModel.fromJson(response.data).result ?? [];
    return results;
  }
}
