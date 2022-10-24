import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:troubleskiller_blog/data/github_dart.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';
import 'package:troubleskiller_blog/widget/github_widget/git_hub_repo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    Key? key,
  }) : super(key: key);

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Widget getUserRepoWidget() {
    return ResponsiveGridView.builder(
        shrinkWrap: true,
        gridDelegate: const ResponsiveGridDelegate(
          childAspectRatio: 1.7,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          maxCrossAxisExtent: 500,
          minCrossAxisExtent: 400,
        ),
        itemCount: response.length,
        itemBuilder: (_, int index) {
          return GitHubRepoWidget(
            title: response[index].name ?? '',
            description: response[index].description ?? '',
            linkAction: () {
              _launchUrl(
                Uri.parse(response[index].htmlUrl ?? ''),
              );
            },
            time: response[index].createdAt!.split('-')[0],
            countOfStars: response[index].countOfStars ?? 0,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Projects',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 20,
              ),
              getUserRepoWidget(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
