import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/wrapper_widget/wrapper_image.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Hi, I\'m Troubleskiller',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'I\'m a software engineer from china,who creates open-source projects and writes about code, design, and life.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'I love coding and McDonalds, other than that my favourite anime is Attack of the Titans and I wish I was a complete genius at fps games if that were possible.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const ImageWrapper(image: 'assets/image/main_page_image.jpg'),
      ],
    );
  }
}
