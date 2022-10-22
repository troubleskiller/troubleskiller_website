import 'package:flutter/material.dart';

class GitHubRepoWidget extends StatelessWidget {
  const GitHubRepoWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          color: Color.fromRGBO(241, 243, 245, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
