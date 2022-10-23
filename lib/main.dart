import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/screen/about_me_screen/about_me_screen.dart';
import 'package:troubleskiller_blog/screen/main_screen/main_screen.dart';
import 'package:troubleskiller_blog/screen/project_screen/project_screen.dart';
import 'package:troubleskiller_blog/screen/writing_screen/writing_screen.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_app_bar.dart';

import 'controller/github_controller/github_controller.dart';
import 'model/github_repos_model/GitHubRepoModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activePageIndex = 0;

  double? _deviceWidth;

  final PageController pageController = PageController();

  void setActivePageIndex(int index) {
    setState(() {
      activePageIndex = index;
    });
  }

  final GitHubController _githubController = GitHubController();
  List<GitHubRepoModel> githubRepos = [];

  Future<void> getUserRepo() async {
    githubRepos = await _githubController.getRepos();
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        deviceWidth: _deviceWidth!,
        changeIndex: setActivePageIndex,
        pageController: pageController,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: setActivePageIndex,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MainScreen(),
          AboutMeScreen(),
          WritingScreen(),
          ProjectScreen(
            githubRepos: githubRepos,
          )
        ],
      ),
    );
  }
}
