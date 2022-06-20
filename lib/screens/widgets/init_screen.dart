import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: const Login(),
      title: const Text(
        'GeeksForGeeks',
        textScaleFactor: 2,
      ),
      image: Image.network(
          'https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
