import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    this.preferredSize = const Size.fromHeight(80),
  }) : super(key: key);

  @override
  final Size preferredSize;

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
              CommonButton(title: 'troubleskiller', linkAction: () {}),
              const SizedBox(width: 30),
              CommonTextButton(
                title: 'About me',
                color: Colors.green,
                linkAction: () {},
              ),
              const SizedBox(width: 30),
              CommonTextButton(
                title: 'Writing',
                color: Colors.blue,
                linkAction: () {},
              ),
              const SizedBox(width: 30),
              CommonTextButton(
                title: 'Project',
                color: Colors.yellow,
                linkAction: () {},
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
