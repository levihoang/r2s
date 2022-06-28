import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/src/locator.dart';

import 'src/utils/routing/route.dart';
import 'src/utils/routing/route_name.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "It Intership Jobs",
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.grey,
            ),
      ),
      // home: const ChangePasswordScreen(),
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}
