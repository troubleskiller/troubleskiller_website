import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';
import 'package:troubleskiller_blog/widget/common_widet/wrapper_widget/wrapper_image.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.grey,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Text(
                              'Hi, I\'m Troubleskiller',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Text(
                              'I\'m a software engineer from china,who creates open-source projects and writes about code, design, and life.',
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
                  ImageWrapper(image: 'assets/image/main_page_image.jpg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
