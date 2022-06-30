import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_intership_jobs_r2s/src/ui/login_outPage/loginandsignup_screen.dart';

class UnLoginPage extends StatefulWidget {
  const UnLoginPage({Key? key}) : super(key: key);

  @override
  State<UnLoginPage> createState() => _UnLoginPageState();
}

class _UnLoginPageState extends State<UnLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("images/un_login.png"),
                ),
                const Text(
                  "Bạn cần phải đăng nhập để sử dụng tính năng này.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Get.to(() => const LoginSignupScreen());
                  },
                  child: const Text('Đăng nhập'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
