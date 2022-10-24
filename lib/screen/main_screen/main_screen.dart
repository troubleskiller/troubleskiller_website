import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 12,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: Container(
                  // width: 560,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, I\'m Troubleskiller',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'I\'m a software engineer from china,who creates open-source projects and writes about code, design, and life.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.start,
                  direction: Axis.vertical,
                  children: [Image.asset('assets/image/main_page_image.jpg')],
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
