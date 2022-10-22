import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/controller/github_controller/github_controller.dart';
import 'package:troubleskiller_blog/model/github_repos_model/GitHubRepoModel.dart';
import 'package:troubleskiller_blog/widget/github_widget/git_hub_repo_widget.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final GitHubController _githubController = GitHubController();
  List<GitHubRepoModel> githubRepos = [];

  Future<void> getUserRepo() async {
    githubRepos = await _githubController.getRepos();
    print(githubRepos[0].fullName);
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
        itemCount: githubRepos.length,
        itemBuilder: (_, int index) {
          return GitHubRepoWidget(
            title: githubRepos[index].name ?? '',
          );
        });
  }
}
