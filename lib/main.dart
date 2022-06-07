import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/locator.dart';
import 'package:it_intership_jobs_r2s/screens/login.dart';
import 'package:it_intership_jobs_r2s/screens/register.dart';
import 'package:it_intership_jobs_r2s/utils/routing/route.dart';
import 'package:it_intership_jobs_r2s/utils/routing/route_name.dart';

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
      theme: ThemeData(),
      // home: Login(),
      onGenerateRoute: generateRoute,
      initialRoute: RegisterRoute,
    );
  }
}
