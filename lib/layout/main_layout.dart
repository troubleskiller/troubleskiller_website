import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 80), child: child),
    );
  }
}

class PostArticleCard extends StatelessWidget {
  const PostArticleCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width > 800
        ? MediaQuery.of(context).size.width / 1.8
        : MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: child,
    );
  }
}
