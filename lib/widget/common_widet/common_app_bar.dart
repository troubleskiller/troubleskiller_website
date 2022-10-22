import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    this.preferredSize = const Size.fromHeight(80),
  }) : super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
          color: Color.fromRGBO(242, 243, 245, 1.0),
          border: Border.symmetric(
              vertical: BorderSide(
                  width: 1, color: Color.fromRGBO(234, 236, 239, 1.0)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CommonButton(title: 'troubleskiller'),
              SizedBox(width: 30),
              CommonTextButton(title: 'About me'),
              SizedBox(width: 30),
              CommonTextButton(title: 'Writing'),
              SizedBox(width: 30),
              CommonTextButton(title: 'Project'),
              SizedBox(width: 30),
              CommonTextButton(title: 'GitHub'),
            ],
          ),
          CommonButton(title: 'Light'),
        ],
      ),
    );
  }
}
