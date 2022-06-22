import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/home_screen.dart';
import 'package:it_intership_jobs_r2s/screens/pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: const HomeScreen(),
      title: const Text(
        'It InternshipJob',
        textScaleFactor: 2,
      ),
      image: Image.asset("images/logo_company.png"),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.orange,
    );
  }
}
