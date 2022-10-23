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
    required this.deviceWidth,
  }) : super(key: key);

  @override
  final Size preferredSize;
  final Function changeIndex;
  final PageController pageController;
  final double deviceWidth;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(vertical: deviceWidth > 900 ? 20 : 10),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(242, 243, 245, 1.0),
          border: Border.symmetric(
              vertical: BorderSide(
                  width: 1, color: Color.fromRGBO(234, 236, 239, 1.0)))),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(flex: deviceWidth > 900 ? 8 : 1, child: SizedBox()),
          Expanded(
            // flex: 15,
            flex: deviceWidth > 900 ? 30 : 19,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: deviceWidth > 900 ? 8 : 4,
                  child: CommonButton(
                      deviceWidth: deviceWidth,
                      title: deviceWidth > 900 ? 'troubleskiller' : '',
                      icon: Icon(
                        Icons.save_as_outlined,
                        color: Colors.grey,
                      ),
                      linkAction: () {
                        // changeIndex;
                        pageController.jumpToPage(0);
                      }),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 6,
                    child: CommonTextButton(
                      deviceWidth: deviceWidth,
                      title: 'About me',
                      color: Colors.green,
                      linkAction: () {
                        pageController.jumpToPage(1);
                      },
                    )),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 5,
                  child: CommonTextButton(
                    deviceWidth: deviceWidth,
                    title: 'Writing',
                    color: Colors.blue,
                    linkAction: () {
                      pageController.jumpToPage(2);
                    },
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 5,
                  child: CommonTextButton(
                    deviceWidth: deviceWidth,
                    title: 'Project',
                    color: Colors.yellow,
                    linkAction: () {
                      pageController.jumpToPage(3);
                    },
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                deviceWidth > 600
                    ? Expanded(
                        flex: 4,
                        child: CommonTextButton(
                          deviceWidth: deviceWidth,
                          title: 'GitHub',
                          color: Colors.purple,
                          linkAction: () {
                            _launchUrl(
                              Uri.parse('https://github.com/troubleskiller'),
                            );
                          },
                        ))
                    : Expanded(flex: 3, child: SizedBox()),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
          Expanded(
              flex: deviceWidth > 900 ? 3 : 2,
              child: CommonButton(
                  deviceWidth: deviceWidth,
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: Color.fromRGBO(
                      226,
                      181,
                      67,
                      1.0,
                    ),
                  ),
                  title: deviceWidth > 900 ? 'Light' : '',
                  linkAction: () {})),
          Expanded(flex: deviceWidth > 900 ? 8 : 1, child: SizedBox()),
        ],
      ),
    );
  }
}
