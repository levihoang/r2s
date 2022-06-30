import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_intership_jobs_r2s/src/locator.dart';
import 'package:it_intership_jobs_r2s/src/ui/mainScreen/home_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "It Intership Jobs",
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.grey,
            ),
      ),
      home: const HomeScreen(),
      // onGenerateRoute: generateRoute,
      // initialRoute: HomeRoute,
    );
  }
}
