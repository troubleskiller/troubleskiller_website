import 'package:flutter/widgets.dart';

class Routes {
  static const String home = "/";
  static const String aboutMe = "aboutMe";
  static const String writing = "writing";
  static const String project = "project";

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),

      /// 暂时不考虑添加动画
      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //   return FadeScaleTransition(animation: animation, child: child);
      // },
    );
  }
}
