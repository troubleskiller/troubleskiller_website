import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:troubleskiller_blog/helper/router.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';
import 'package:troubleskiller_blog/widget/main_widget/main_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            children: [
              const MainWidget(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Posts',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  CommonBlankButton(
                    title: 'View all',
                    linkAction: () {
                      Navigator.pushNamed(context, Routes.writing);
                    },
                  ),
                ],
              ),
              ResponsiveGridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const ResponsiveGridDelegate(
                    childAspectRatio: 1.7,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: 500,
                    minCrossAxisExtent: 400,
                  ),
                  itemCount: 3,
                  itemBuilder: (_, int index) {
                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
