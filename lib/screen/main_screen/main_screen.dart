import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                children: [
                  Container(
                    // width: 560,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, I\'m Troubleskiller',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'I\'m a software engineer from china,who creates open-source projects and writes about code, design, and life.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/image/main_page_image.jpg',
                    height: 200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
