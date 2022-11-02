import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.title,
    required this.categoryName,
    required this.linkAction,
    required this.time,
  }) : super(key: key);
  final String title;
  final String categoryName;
  final String time;
  final Function linkAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 243, 245, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                decoration: TextDecoration.none),
          ),
          const Spacer(),
          ContentTextButton(
            title: title,
            color: Colors.black,
            linkAction: linkAction,
          ),
          const Spacer(),
          Text(
            categoryName,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.none),
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
