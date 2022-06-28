import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: const HomeScreen(),
      title: Text(
        '''  Chào mừng bạn đến với
          IT InternshipJob        
         ''',
        textScaleFactor: 2,
      ),
      image: Image.asset("images/logo_company.png"),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.orange,
    );
  }
}
