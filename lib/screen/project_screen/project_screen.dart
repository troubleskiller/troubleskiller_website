import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/model/github_repos_model/GitHubRepoModel.dart';
import 'package:troubleskiller_blog/widget/github_widget/git_hub_repo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key, required this.githubRepos}) : super(key: key);
  final List<GitHubRepoModel> githubRepos;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  List<GitHubRepoModel> githubRepos = [];

  // final GitHubController _githubController = GitHubController();
  // List<GitHubRepoModel> githubRepos = [];
  //
  // bool fetchLoading = true;
  //
  // Future<void> getUserRepo() async {
  //   githubRepos = await _githubController.getRepos();
  //   fetchLoading = false;
  //   print(githubRepos[0].fullName);
  // }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // getUserRepo();
    githubRepos = widget.githubRepos;
    print(githubRepos);
    super.initState();
  }

  Widget getUserRepoWidget() {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.8, //宽高比为1时，子widget
          mainAxisSpacing: 20.0, // 纵轴间距
          crossAxisSpacing: 20.0,
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Projects',
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        getUserRepoWidget(),
      ],
    );
  }
}
