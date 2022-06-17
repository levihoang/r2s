import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/home_screen.dart';
import 'package:it_intership_jobs_r2s/screens/login.dart';

import 'package:it_intership_jobs_r2s/screens/register.dart';
import 'package:it_intership_jobs_r2s/utils/routing/route_name.dart';

PageRoute generateRoute(RouteSettings settings) {
  print("generateRoute: ${settings.name}");
  switch (settings.name) {
    case LoginRoute:
      return _getPageRoute(const Login());
    case RegisterRoute:
      return _getPageRoute(const Register());
    case HomeRoute:
      return _getPageRoute(const HomeScreen());

    default:
      return _getPageRoute(const Login());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
