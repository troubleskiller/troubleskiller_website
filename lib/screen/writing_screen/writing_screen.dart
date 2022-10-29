import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({Key? key}) : super(key: key);

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body:
          // Center(
          //   child: Container(
          //     height: 200,
          //     width: 200,
          //     color: Colors.green,
          //   ),
          // )
          Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
