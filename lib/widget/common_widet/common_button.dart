import 'package:flutter/material.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(234, 236, 239, 1.0),
            border:
                Border.all(color: Color.fromRGBO(207, 212, 217, 1.0), width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            icon ?? Container(),
            Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.black54),
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
  }) : super(key: key);
  final String title;

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
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
            decoration: isHove ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
