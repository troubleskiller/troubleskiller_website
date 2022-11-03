import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/data/common_date.dart';
import 'package:troubleskiller_blog/model/category_model.dart';
import 'package:troubleskiller_blog/screen/writing_screen/post_detail_screen.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';
import 'package:troubleskiller_blog/widget/writing_widget/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, required this.categoryModel})
      : super(key: key);
  final CategoryModel categoryModel;

  @override
  List<Widget> getCategoryList() {
    return categoryResponse
        .map(
          (f) => CategoryList(
            categoryModel: f,
          ),
        )
        .toList();
  }

  List<Widget> getBlogList(BuildContext context) {
    return blogResponse
        .where((element) => element.categoryId == categoryModel.id)
        .toList()
        .map((e) => ButTextButton(
            title: e.title ?? '',
            linkAction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetailScreen(blogModel: e),
                ),
              );
            }))
        .toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    categoryModel.categoryName ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: getBlogList(context),
                  )
                ],
              ),
              Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: getCategoryList(),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 243, 245, 1.0),
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
