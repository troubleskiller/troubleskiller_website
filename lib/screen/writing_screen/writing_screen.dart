import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/controller/blog_controller/blog_controller.dart';
import 'package:troubleskiller_blog/controller/category_controller/category_controller.dart';
import 'package:troubleskiller_blog/model/blog_model.dart';
import 'package:troubleskiller_blog/model/category_model.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';
import 'package:troubleskiller_blog/widget/writing_widget/category_widget.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({Key? key}) : super(key: key);

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  CategoryController categoryController = new CategoryController();
  BlogController blogController = new BlogController();
  List<CategoryModel> categoryList = [];
  List<BlogModel> blogList = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  Future<void> initData() async {
    await getCategories();
    await getBlogs();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> getCategories() async {
    categoryList = await categoryController.selectAllCategory();
  }

  Future<void> getBlogs() async {
    blogList = await blogController.selectAllBlog();
  }

  List<Widget> getCategoryList() {
    return categoryList
        .map(
          (f) => CategoryList(
            categoryModel: f,
          ),
        )
        .toList();
  }

  List<Widget> getBlogList() {
    return blogList
        .map(
          (f) => ButTextButton(
            title: f.title ?? '',
            linkAction: () async {},
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container()
        : Scaffold(
            appBar: CommonAppBar(),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
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
                        const Text(
                          'Writing',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: getBlogList(),
                        )
                      ],
                    ),
                    Container(
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
