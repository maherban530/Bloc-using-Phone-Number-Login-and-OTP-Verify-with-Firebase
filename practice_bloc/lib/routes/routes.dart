import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/first.dart';
import 'package:practice/screens/home.dart';
import 'package:practice/screens/third.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/first':
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case '/third':
        return MaterialPageRoute(builder: (_) => SecondScreen(login:routeSettings.arguments.toString()));

      default:
        return null;
    }
  }
}
