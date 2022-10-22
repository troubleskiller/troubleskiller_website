import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/controller/github_controller/github_controller.dart';
import 'package:troubleskiller_blog/model/github_repos_model/GitHubRepoModel.dart';
import 'package:troubleskiller_blog/widget/github_widget/git_hub_repo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final GitHubController _githubController = GitHubController();
  List<GitHubRepoModel> githubRepos = [];

  bool fetchLoading = true;

  Future<void> getUserRepo() async {
    githubRepos = await _githubController.getRepos();
    fetchLoading = false;
    print(githubRepos[0].fullName);
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return fetchLoading
        ? Container()
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横轴三个子widget
                childAspectRatio: 1.8 //宽高比为1时，子widget
                ),
            itemCount: githubRepos.length,
            itemBuilder: (_, int index) {
              return GitHubRepoWidget(
                title: githubRepos[index].name ?? '',
                description: githubRepos[index].description ?? '',
                linkAction: () {
                  _launchUrl(
                    Uri.parse(githubRepos[index].htmlUrl ?? ''),
                  );
                },
                time: githubRepos[index].createdAt!.split('-')[0],
                countOfStars: githubRepos[index].countOfStars ?? 0,
              );
            });
  }
}
