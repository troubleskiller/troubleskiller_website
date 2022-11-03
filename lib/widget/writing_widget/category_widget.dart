import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/data/common_date.dart';
import 'package:troubleskiller_blog/model/category_model.dart';
import 'package:troubleskiller_blog/screen/writing_screen/category_screen.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool isHove = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  CategoryScreen(categoryModel: widget.categoryModel),
            ),
          );
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: BoxDecoration(
              color: isHove ? Colors.green : null,
              borderRadius: BorderRadius.circular(3)),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoryModel.categoryName ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: isHove ? Colors.white : Colors.black),
              ),
              Text(
                blogResponse
                    .where((element) =>
                        element.categoryId == widget.categoryModel.id)
                    .length
                    .toString(),
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: isHove ? Colors.white : Colors.black),
              )
            ],
          ),
        ),
      ),
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
