import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/helper/common_helper.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.title, this.icon})
      : super(key: key);
  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(234, 236, 239, 1.0),
            border: Border.all(
                color: const Color.fromRGBO(207, 212, 217, 1.0), width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            icon ?? Container(),
            Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonTextButton extends StatefulWidget {
  const CommonTextButton({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  State<CommonTextButton> createState() => _CommonTextButtonState();
}

class _CommonTextButtonState extends State<CommonTextButton> {
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
        onTap: () {},
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ),
          isHove
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: CommonHelper.boundingTextSize(
                      widget.title,
                      const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ).width,
                    height: 2,
                    color: widget.color,
                  ),
                )
              : Container()
        ]),
      ),
    );
  }
}
