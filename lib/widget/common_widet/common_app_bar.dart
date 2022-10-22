import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';
import 'package:url_launcher/url_launcher.dart';

enum CommonBar {
  main,
  aboutMe,
  writing,
  project,
}

final Map<int, CommonBar> CommonBarIndexDictionary = {
  0: CommonBar.main,
  1: CommonBar.aboutMe,
  2: CommonBar.writing,
  3: CommonBar.project,
};

final Map<String, CommonBar> CommonBarStringDictionary = {
  "main": CommonBar.main,
  "aboutMe": CommonBar.aboutMe,
  "writing": CommonBar.writing,
  "project": CommonBar.project,
};

final List<String> tickerTabStrings = <String>[
  'main',
  'aboutMe',
  'writing',
];

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    this.preferredSize = const Size.fromHeight(80),
    required this.changeIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  final Size preferredSize;
  final Function changeIndex;
  final PageController pageController;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(242, 243, 245, 1.0),
          border: Border.symmetric(
              vertical: BorderSide(
                  width: 1, color: Color.fromRGBO(234, 236, 239, 1.0)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CommonButton(
                  title: 'troubleskiller',
                  linkAction: () {
                    // changeIndex;
                    pageController.jumpToPage(0);
                  }),
              const SizedBox(width: 30),
              CommonTextButton(
                title: 'About me',
                color: Colors.green,
                linkAction: () {
                  pageController.jumpToPage(1);
                },
              ),
              const SizedBox(width: 30),
              CommonTextButton(
                title: 'Writing',
                color: Colors.blue,
                linkAction: () {
                  pageController.jumpToPage(2);
                },
              ),
              const SizedBox(width: 30),
              CommonTextButton(
                title: 'Project',
                color: Colors.yellow,
                linkAction: () {
                  pageController.jumpToPage(3);
                },
              ),
              const SizedBox(width: 30),
              CommonTextButton(
                title: 'GitHub',
                color: Colors.purple,
                linkAction: () {
                  _launchUrl(
                    Uri.parse('https://github.com/troubleskiller'),
                  );
                },
              ),
            ],
          ),
          CommonButton(title: 'Light', linkAction: () {}),
        ],
      ),
    );
  }
}
