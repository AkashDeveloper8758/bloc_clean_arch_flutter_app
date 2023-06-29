import 'package:cleanapp/config/router/route_arguments.dart';
import 'package:cleanapp/presentation/ui/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

import './route_transition.dart';
import '../../presentation/ui/screens/home_screen/home.dart';

class RouteName {
  static const homescreen = '/homescreen';
  static const userDetailScreen = '/userDetailScreen';
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = settings.name;
    final arguments = settings.arguments;

    switch (route) {
      case '/':
        return AppTransations.getSlideTransationRtL(
            transitionChild: const MyHomePage());

      case RouteName.homescreen:
        return AppTransations.getSlideTransationRtL(
            transitionChild: const MyHomePage());
      case RouteName.userDetailScreen:
        final userArgs = arguments as UserDetailArgs;
        return AppTransations.getSlideTransationRtL(
            transitionChild: DetailScreen(userModel: userArgs.userModel));

      default:
        return AppTransations.getSlideTransationRtL(
            transitionChild: const MyHomePage());
    }
  }
}
