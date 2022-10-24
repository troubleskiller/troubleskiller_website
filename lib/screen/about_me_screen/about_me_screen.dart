import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
          child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      )),
    );
  }
}
