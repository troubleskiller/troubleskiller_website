import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/helper/common_helper.dart';

class CommonButton extends StatefulWidget {
  const CommonButton(
      {Key? key, required this.title, this.icon, required this.linkAction})
      : super(key: key);
  final String title;
  final Widget? icon;
  final Function linkAction;

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
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
          widget.linkAction();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
              color: isHove
                  ? Color.fromRGBO(223, 226, 230, 1.0)
                  : Color.fromRGBO(234, 236, 239, 1.0),
              border: Border.all(
                  color: isHove
                      ? Color.fromRGBO(174, 181, 188, 1.0)
                      : Color.fromRGBO(207, 212, 217, 1.0),
                  width: 2),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              widget.icon ?? Container(),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ],
          ),
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
    required this.linkAction,
  }) : super(key: key);
  final String title;
  final Color color;
  final Function linkAction;

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
        onTap: () {
          widget.linkAction();
        },
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
                    margin: const EdgeInsets.only(bottom: 5),
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
