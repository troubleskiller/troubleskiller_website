import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/model/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(categoryModel.categoryName ?? ''),
    );
  }
}

class ButTextButton extends StatefulWidget {
  const ButTextButton({
    Key? key,
    required this.title,
    required this.linkAction,
  }) : super(key: key);
  final String title;
  final Function linkAction;

  @override
  State<ButTextButton> createState() => _ButTextButtonState();
}

class _ButTextButtonState extends State<ButTextButton> {
  bool isHove = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      onEnter: (_) {
        setState(() {
          isHove = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHove = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.linkAction();
        },
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration:
                  isHove ? TextDecoration.underline : TextDecoration.none,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: Colors.black),
          maxLines: 1,
        ),
      ),
    );
  }
}
