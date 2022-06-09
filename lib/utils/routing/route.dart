import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/detail_post_screen.dart';
import 'package:it_intership_jobs_r2s/screens/home_screen.dart';
import 'package:it_intership_jobs_r2s/screens/login.dart';
import 'package:it_intership_jobs_r2s/screens/profile_screen.dart';
import 'package:it_intership_jobs_r2s/screens/register.dart';
import 'package:it_intership_jobs_r2s/screens/fillter.dart';
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
    case DetailPostRoute:
      return _getPageRoute(const DetailPostScreen());
    case ProfileRoute:
      return _getPageRoute(const ProfileScreen());
    case FillterRoute:
      return _getPageRoute(const Fillter());
    default:
      return _getPageRoute(const Login());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
