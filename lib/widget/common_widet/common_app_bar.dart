import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/helper/router.dart';
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

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(125.0),
        super(key: key);
  @override
  final Size preferredSize;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: MediaQuery.of(context).size.width > 800 ? 80 : 20),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(242, 243, 245, 1.0),
              border: Border.symmetric(
                  vertical: BorderSide(
                      width: 1, color: Color.fromRGBO(234, 236, 239, 1.0)))),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CommonButton(
                      title: MediaQuery.of(context).size.width > 800
                          ? 'troubleskiller'
                          : '',
                      icon: Icon(
                        Icons.save_as_outlined,
                        color: Colors.grey,
                      ),
                      linkAction: () {
                        Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName));
                      }),
                  SizedBox(
                    width: 20,
                  ),
                  CommonTextButton(
                    title: 'About me',
                    color: Colors.green,
                    linkAction: () {
                      Navigator.pushNamed(context, Routes.aboutMe);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CommonTextButton(
                    title: 'Writing',
                    color: Colors.blue,
                    linkAction: () {
                      Navigator.pushNamed(context, Routes.writing);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CommonTextButton(
                    title: 'Project',
                    color: Colors.yellow,
                    linkAction: () {
                      Navigator.pushNamed(context, Routes.project);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MediaQuery.of(context).size.width > 700
                      ? CommonTextButton(
                          title: 'GitHub',
                          color: Colors.purple,
                          linkAction: () {
                            _launchUrl(
                              Uri.parse('https://github.com/troubleskiller'),
                            );
                          },
                        )
                      : Container(),
                ],
              ),
              CommonButton(
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: Color.fromRGBO(
                      226,
                      181,
                      67,
                      1.0,
                    ),
                  ),
                  title: MediaQuery.of(context).size.width > 800 ? 'Light' : '',
                  linkAction: () {}),
            ],
          ),
        ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 30),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}
