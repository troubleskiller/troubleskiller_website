import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  final String image;

  const ImageWrapper({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Listen to inherited widget width updates.
    double width = MediaQuery.of(context).size.width / 4;

    print(width);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Image.asset(
        image,
        width: width,
        height: width / 0.8,
        fit: BoxFit.cover,
      ),
    );
  }
}
