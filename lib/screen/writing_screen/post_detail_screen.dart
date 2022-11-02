import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:troubleskiller_blog/layout/main_layout.dart';
import 'package:troubleskiller_blog/model/blog_model.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({Key? key, required this.blogModel}) : super(key: key);
  final BlogModel blogModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(),
        body: MainLayout(
            child: Row(
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
                  ),
                )),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            // 个人概述卡片 和 文章概述卡片
            Column(
              children: [],
            ),
          ],
        )));
  }
}
