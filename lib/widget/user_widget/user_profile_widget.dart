import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromRGBO(241, 243, 245, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(77, 80, 85, 1)),
          ),
          SizedBox(
            height: 20,
          ),
          UserAvatar(),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: const Text(
              'Hi, I\'m Troubleskiller,I\'m a software engineer from china,who creates open-source projects and writes about code, design, and life.',
              style: TextStyle(
                  color: Color.fromRGBO(97, 101, 106, 1),
                  fontSize: 16,
                  height: 1.6),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: const Text(
              'I love coding and McDonalds, other than that my favourite anime is Attack of the Titans and I wish I was a complete genius at fps games if that were possible.',
              style: TextStyle(
                  color: Color.fromRGBO(97, 101, 106, 1),
                  fontSize: 16,
                  height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
            image: AssetImage('assets/image/avatar.jpeg'), fit: BoxFit.cover),
      ),
    );
  }
}
