import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/home_screen.dart';

import 'package:it_intership_jobs_r2s/utils/routing/route_name.dart';

PageRoute generateRoute(RouteSettings settings) {
  print("generateRoute: ${settings.name}");
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeScreen());

    default:
      return _getPageRoute(const HomeScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
