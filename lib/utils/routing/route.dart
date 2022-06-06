import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/utils/routing/route_name.dart';
import 'package:it_intership_jobs_r2s/utils/screens/login.dart';
import 'package:it_intership_jobs_r2s/utils/screens/register.dart';

PageRoute generateRoute(RouteSettings settings) {
  print("generateRoute: ${settings.name}");
  switch (settings.name) {
    case LoginRoute:
      return _getPageRoute(const Login());
    case RegisterRoute:
      return _getPageRoute(const Register());
    default:
      return _getPageRoute(const Login());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
