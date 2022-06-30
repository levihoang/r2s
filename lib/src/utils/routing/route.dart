import 'package:flutter/material.dart';

import '../../ui/mainScreen/home_screen.dart';
import 'route_name.dart';

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
