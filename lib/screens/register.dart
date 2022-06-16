import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/locator.dart';
import 'package:it_intership_jobs_r2s/services/register_api.dart';
import 'package:it_intership_jobs_r2s/widgets/input_box.dart';
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

  _register() async {
    Map data = {
      "username": _username.text,
      "password": _password.text,
      "confirmPassword": _confirmPassword.text,
      "role": {
        "id": 3,
      },
      "email": _email.text,
    };
    print(data);
    String body = json.encode(data);
    // String body = json.encode(data);

    var response = await CallRegisterApi().postData(body, "/user/add");
    // var response =
    //     await CallRegisterApi().postData(jsonEncode(body), "/register");
    var myResponse = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      print('register success');
      setState(() {
        announcement = "register success";
      });
    } else {
      print(response.statusCode);
      setState(() {
        if (myResponse["Email"].toString().isNotEmpty) {
          announcement = myResponse["Email"];
          print(myResponse["Email"]);
        } else {
          announcement = myResponse["username"];
        }
      });
    }
  }

  bool circular = false;
  bool isChecked = false;
  String announcement = "";
  @override
  Widget build(BuildContext context) {
    double sizediv = MediaQuery.of(context).size.width / 39;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: sizediv * 4),
              child: Column(
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
                      SizedBox(
                        height: sizediv * 3,
                      ),
                      InputBox(
                          btnname: "Tài Khoản",
                          size: sizediv,
                          controller: _username,
                          obscureText: false),
                      SizedBox(
                        height: sizediv,
                      ),
                      InputBox(
                          btnname: "Mật Khẩu",
                          size: sizediv,
                          controller: _password,
                          obscureText: true),
                      SizedBox(
                        height: sizediv,
                      ),
                      InputBox(
                          btnname: "Xác nhận mật khẩu",
                          size: sizediv,
                          controller: _confirmPassword,
                          obscureText: true),
                      SizedBox(
                        height: sizediv,
                      ),
                      InputBox(
                          btnname: "Email",
                          size: sizediv,
                          controller: _email,
                          obscureText: false),
                      SizedBox(
                        height: sizediv * 3,
                      ),
                      getAnnouncement(),
                    ],
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
                  _register();
                  // if (isValidEmail(_email.text)) {
                  //   _register();
                  // } else {
                  //   announcement = "Email không không đúng định dạng";
                  // }
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
            color: Colors.orangeAccent),
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

  Widget getAnnouncement() {
    double sizediv = MediaQuery.of(context).size.width / 39;
    return SizedBox(
      height: sizediv * 5,
      width: MediaQuery.of(context).size.width - sizediv * 4,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: unnecessary_null_comparison
            children: [
              // ignore: unnecessary_null_comparison
              announcement == ""
                  ? const SizedBox()
                  : message(sizediv, announcement)
            ],
          ),
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

  // bool isValidEmail(String value) {
  //   return RegExp(
  //           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
  //       .hasMatch(value);
  // }

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
