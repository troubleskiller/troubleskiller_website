import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  final String image;

  const ImageWrapper({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Listen to inherited widget width updates.
    double width = MediaQuery.of(context).size.width / 4;
    return MediaQuery.of(context).size.width > 800
        ? Container(
            margin: EdgeInsets.only(left: 30),
            child: Image.asset(
              image,
              width: width,
              height: width / 1.6,
              fit: BoxFit.cover,
            ),
          )
        : Container();
  }
}
