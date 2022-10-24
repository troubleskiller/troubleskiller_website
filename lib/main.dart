import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:troubleskiller_blog/data/github_dart.dart';
import 'package:troubleskiller_blog/helper/router.dart';
import 'package:troubleskiller_blog/screen/about_me_screen/about_me_screen.dart';
import 'package:troubleskiller_blog/screen/main_screen/main_screen.dart';
import 'package:troubleskiller_blog/screen/project_screen/project_screen.dart';
import 'package:troubleskiller_blog/screen/writing_screen/writing_screen.dart';

import 'controller/github_controller/github_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GitHubController _githubController = GitHubController();

  Future<void> getUserRepo() async {
    response = await _githubController.getRepos();
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      initialRoute: Routes.project,
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case Routes.home:
              return const MainScreen();
            case Routes.project:
              return const ProjectScreen();
            case Routes.writing:
              return const WritingScreen();
            case Routes.aboutMe:
              return const AboutMeScreen();
            default:
              return const SizedBox.shrink();
          }
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int activePageIndex = 0;
//
//   double? _deviceWidth;
//
//   final PageController pageController = PageController();
//
//   void setActivePageIndex(int index) {
//     setState(() {
//       activePageIndex = index;
//     });
//   }
//
//   final GitHubController _githubController = GitHubController();
//   List<GitHubRepoModel> githubRepos = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getUserRepo();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _deviceWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CommonAppBar(
//         deviceWidth: _deviceWidth!,
//         changeIndex: setActivePageIndex,
//         pageController: pageController,
//       ),
//       body: PageView(
//         controller: pageController,
//         onPageChanged: setActivePageIndex,
//         // scrollDirection: Axis.vertical,
//         // physics: NeverScrollableScrollPhysics(),
//         children: [
//           MainScreen(
//             deviceWidth: _deviceWidth!,
//           ),
//           AboutMeScreen(),
//           WritingScreen(),
//           ProjectScreen(
//             githubRepos: githubRepos,
//             deviceWidth: _deviceWidth!,
//           )
//         ],
//       ),
//     );
//   }
// }
