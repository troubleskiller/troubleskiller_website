import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:troubleskiller_blog/data/common_date.dart';
import 'package:troubleskiller_blog/helper/router.dart';
import 'package:troubleskiller_blog/layout/main_layout.dart';
import 'package:troubleskiller_blog/screen/writing_screen/post_detail_screen.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';
import 'package:troubleskiller_blog/widget/main_widget/main_widget.dart';
import 'package:troubleskiller_blog/widget/main_widget/post_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: MainLayout(
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
            SizedBox(
              height: 30,
            ),
            ResponsiveGridView.builder(
                shrinkWrap: true,
                gridDelegate: const ResponsiveGridDelegate(
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  maxCrossAxisExtent: 500,
                  minCrossAxisExtent: 400,
                ),
                itemCount: blogResponse.length < 6 ? blogResponse.length : 6,
                itemBuilder: (_, int index) {
                  return PostCard(
                    title: blogResponse[index].title ?? '',
                    categoryName: categoryResponse
                            .singleWhere((element) =>
                                element.id == blogResponse[index].categoryId)
                            .categoryName ??
                        '',
                    linkAction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              PostDetailScreen(blogModel: blogResponse[index]),
                        ),
                      );
                    },
                    time: DateTime.fromMillisecondsSinceEpoch(
                            blogResponse[index].publishTime ?? 0)
                        .toString(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
