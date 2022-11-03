import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/data/common_date.dart';
import 'package:troubleskiller_blog/model/blog_model.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';

class BlogProfileWidget extends StatelessWidget {
  const BlogProfileWidget({Key? key, required this.blogModel})
      : super(key: key);
  final BlogModel blogModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromRGBO(241, 243, 245, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DETAILS',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(77, 80, 85, 1)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              '发布于 ${DateTime.fromMillisecondsSinceEpoch(blogModel.publishTime ?? 0).toString().split('.')[0]}'),
          SizedBox(
            height: 10,
          ),
          Text(
            'CATEGORY',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(77, 80, 85, 1)),
          ),
          SizedBox(
            height: 10,
          ),
          ContentTextButton(
            title: categoryResponse
                    .singleWhere(
                        (element) => element.id == blogModel.categoryId)
                    .categoryName ??
                '',
            color: Colors.black,
            linkAction: () {},
          ),
        ],
      ),
    );
  }
}
