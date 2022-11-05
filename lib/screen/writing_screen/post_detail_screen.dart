import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:troubleskiller_blog/layout/main_layout.dart';
import 'package:troubleskiller_blog/model/blog_model.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';
import 'package:troubleskiller_blog/widget/user_widget/user_profile_widget.dart';
import 'package:troubleskiller_blog/widget/writing_widget/blog_profile_widget.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({Key? key, required this.blogModel}) : super(key: key);
  final BlogModel blogModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(),
        body: MainLayout(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 文章内容 todo： markdown格式
            Column(
              children: [
                PostArticleCard(
                    child: MarkdownBody(
                  data: blogModel.content ?? '',
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    h1: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    pPadding: EdgeInsets.symmetric(vertical: 10),
                    p: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                    h3: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                )),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            // 个人概述卡片 和 文章概述卡片
            MediaQuery.of(context).size.width > 1000
                ? ProfileWidget(
                    blogModel: blogModel,
                  )
                : Container(),
          ],
        )));
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, required this.blogModel}) : super(key: key);
  final BlogModel blogModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileWidget(),
        SizedBox(
          height: 30,
        ),
        BlogProfileWidget(
          blogModel: blogModel,
        )
      ],
    );
  }
}
