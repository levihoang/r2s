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
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _firstname = TextEditingController();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  bool circular = false;
  bool isChecked = false;
  String announcement = "";
  @override
  Widget build(BuildContext context) {
    double sizediv = MediaQuery.of(context).size.width / 39;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: sizediv,
                  ),
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
                  SizedBox(
                    height: sizediv * 3,
                  ),
                  Row(
                    children: [
                      inputBox("Họ", _firstname, false, sizediv / 2.4),
                      inputBox("Tên", _lastname, false, sizediv / 2.4),
                    ],
                  ),
                  SizedBox(
                    height: sizediv,
                  ),
                  inputBox("Tài Khoản", _username, false, sizediv),
                  SizedBox(
                    height: sizediv,
                  ),
                  inputBox("Mật Khẩu", _password, true, sizediv),
                  SizedBox(
                    height: sizediv,
                  ),
                  inputBox(
                      "Xác nhận mật khẩu", _confirmPassword, true, sizediv),
                  SizedBox(
                    height: sizediv,
                  ),
                  inputBox("Email", _email, true, sizediv),
                  SizedBox(
                    height: sizediv * 2,
                  ),
                ],
              ),
              SizedBox(
                height: sizediv * 5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [message(sizediv, announcement)],
                ),
              ),
              button("Đăng Kí", sizediv),
              SizedBox(
                height: sizediv,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bạn đã có tài khoản?"),
                  SizedBox(width: sizediv / 2),
                  link("Đăng nhập", LoginRoute),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputBox(String text, TextEditingController controller,
      bool obscureText, double sizediv) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: sizediv * 39 - 30,
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
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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

  Widget button(String btnname, double sizediv) {
    return InkWell(
      onTap: () async {
        setState(() {
          if (checkFill()) {
            if (_username.text.length > 6 && _username.text.length < 12) {
              if (validPassword(_password.text)) {
                if (_password.text == _confirmPassword.text) {
                  if (isValidEmail(_email.text)) {
                    announcement = "ok";
                  } else {
                    announcement = "Email không không đúng định dạng";
                  }
                } else {
                  announcement = "Xác nhận mật khẩu sai";
                }
              } else {
                announcement = "Mật khẩu không an toàn";
              }
            } else {
              announcement = "Tài khoản phải chứa từ 6 đến 12 kí tự";
            }
          } else {
            announcement = "Vui lòng điền hết thông tin";
          }
          // circular = true;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: sizediv * 5,
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

  Widget message(double sizediv, String announcement) {
    return Column(
      children: [
        Text(
          announcement,
          style: const TextStyle(color: Colors.red, fontSize: 15),
        )
      ],
    );
  }

  bool isValidEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  bool checkFill() {
    if (_username.text.isEmpty ||
        _password.text.isEmpty ||
        _confirmPassword.text.isEmpty ||
        _email.text.isEmpty ||
        _firstname.text.isEmpty ||
        _lastname.text.isEmpty) {
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
