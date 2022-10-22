import 'package:flutter/material.dart';
import 'package:troubleskiller_blog/widget/common_widet/common_button.dart';

class GitHubRepoWidget extends StatelessWidget {
  const GitHubRepoWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.linkAction,
    required this.time,
    required this.countOfStars,
  }) : super(key: key);
  final String title;
  final String description;
  final String time;
  final int countOfStars;
  final Function linkAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 243, 245, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Row(
                children: [
                  Text(countOfStars.toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 15)),
                  const Icon(
                    Icons.star_border,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ContentTextButton(
            title: title,
            color: Colors.black,
            linkAction: linkAction,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(
                color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
            maxLines: 2,
          ),
          const Spacer(),
          Row(
            children: [
              CommonBlankButton(
                icon: const Icon(
                  Icons.send_time_extension_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
                title: 'Source',
                linkAction: linkAction,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
