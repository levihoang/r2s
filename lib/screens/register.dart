import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/locator.dart';
import 'package:it_intership_jobs_r2s/utils/routing/route_name.dart';

import '../utils/routing/navigation_service.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  bool circular = false;
  bool isChecked = false;
  bool isFill = true;
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Container(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text(
                        "IT IntershipJob",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Đăng Kí",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      inputBox("Tài Khoản", _username, Icons.people, false),
                      const SizedBox(
                        height: 10,
                      ),
                      inputBox("Mật Khẩu", _password, Icons.key, true),
                      const SizedBox(
                        height: 10,
                      ),
                      inputBox("Xác nhận mật khẩu", _confirmPassword, Icons.key,
                          true),
                      const SizedBox(
                        height: 10,
                      ),
                      inputBox("Email", _email, Icons.key, true),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [anounnment()],
                    ),
                  ),
                  button("Đăng Kí"),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        const Text("Bạn đã có tài khoản?"),
                        const SizedBox(width: 4),
                        link("Đăng nhập", LoginRoute),
                      ],
                    ),
                  ),

                  // Image.asset(
                  //   "/images/google.ico",
                  //   width: 60.0,
                  //   height: 40.0,
                  //   fit: BoxFit.cover,
                  // )
                ],
              )),
        ),
      ),
    );
  }

  Widget inputBox(String text, TextEditingController controller, IconData icon,
      bool obscureText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 92,
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: controller,
                obscureText: obscureText,
                style: const TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
                // decoration: InputDecoration(

                //   border:
                //       OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                // ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(255, 11, 230, 109))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(255, 14, 219, 96))),
                )),
          ],
        ),
      ),
    );
  }

  Widget button(String btnname) {
    return Padding(
      padding: const EdgeInsets.only(left: 110),
      child: InkWell(
        onTap: () async {
          setState(() {
            if (checkFill()) {
              if (validPassword(_password.text)) {
              } else {
                isValid = false;
              }
            } else {
              isFill = false;
            }
            // circular = true;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 5, 177, 80)),
          child: Center(
            child: circular
                ? const CircularProgressIndicator()
                : Text(
                    btnname,
                    style: const TextStyle(fontSize: 19, color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }

  Widget link(String text, String route) {
    return InkWell(
      onTap: () {
        locator<NavigationService>().globalNavigateTo(route, context);
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          decoration: TextDecoration.underline,
          color: Color.fromARGB(255, 4, 174, 78),
        ),
      ),
    );
  }

  Widget anounnment() {
    return isFill == false
        ? Column(
            children: const [
              Text(
                "Vui lòng điền hết thông tin",
                style: TextStyle(color: Colors.red, fontSize: 15),
              )
            ],
          )
        : isValid == false
            ? Column(
                children: const [
                  Text(
                    "Mật khẩu không an toàn",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ],
              )
            : const SizedBox(
                height: 18,
              );
  }

  bool checkFill() {
    if (_username.text.isEmpty ||
        _password.text.isEmpty ||
        _confirmPassword.text.isEmpty ||
        _email.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool validPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
