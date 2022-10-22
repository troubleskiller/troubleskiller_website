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
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(242, 243, 245, 1.0),
          border: Border.symmetric(
              vertical: BorderSide(
                  width: 1, color: Color.fromRGBO(234, 236, 239, 1.0)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CommonButton(title: 'troubleskiller'),
              SizedBox(width: 30),
              CommonTextButton(
                title: 'About me',
                color: Colors.green,
              ),
              SizedBox(width: 30),
              CommonTextButton(
                title: 'Writing',
                color: Colors.blue,
              ),
              SizedBox(width: 30),
              CommonTextButton(
                title: 'Project',
                color: Colors.yellow,
              ),
              SizedBox(width: 30),
              CommonTextButton(
                title: 'GitHub',
                color: Colors.purple,
              ),
            ],
          ),
          const CommonButton(title: 'Light'),
        ],
      ),
    );
  }
}
