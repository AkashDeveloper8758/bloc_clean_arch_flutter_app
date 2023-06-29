import 'package:flutter/cupertino.dart';

class AppTransations {
  static PageRouteBuilder<dynamic> getSlideTransationRtL<T>(
      {RouteSettings? settings, required Widget transitionChild}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => transitionChild,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
              Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                  .chain(CurveTween(curve: Curves.easeInOut))
                  .animate(animation),
          child: child,
        );
      },
    );
  }
}
