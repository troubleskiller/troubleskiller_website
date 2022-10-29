import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/controller/blog_controller/blog_controller.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final BlogController blogController = BlogController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogController.selectAllBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
          child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      )),
    );
  }
}
