import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/locator.dart';
import 'package:it_intership_jobs_r2s/utils/routing/navigation_service.dart';
import 'package:it_intership_jobs_r2s/utils/routing/route_name.dart';

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
                    locator<NavigationService>()
                        .navigateTo(LoginAndSignInRoute);
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
