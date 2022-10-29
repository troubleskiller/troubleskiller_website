import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/model/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {}, child: Text(categoryModel.categoryName ?? ''));
  }
}
