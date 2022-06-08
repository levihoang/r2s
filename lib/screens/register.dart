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
    double sizediv = MediaQuery.of(context).size.width / 39;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Container(
              // padding: EdgeInsets.only(top: sizediv * 10),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: sizediv * 5,
                  ),
                  inputBox(
                      "Tài Khoản", _username, Icons.people, false, sizediv),
                  SizedBox(
                    height: sizediv,
                  ),
                  inputBox("Mật Khẩu", _password, Icons.key, true, sizediv),
                  SizedBox(
                    height: sizediv,
                  ),
                  inputBox("Xác nhận mật khẩu", _confirmPassword, Icons.key,
                      true, sizediv),
                  SizedBox(
                    height: sizediv,
                  ),
                  inputBox("Email", _email, Icons.key, true, sizediv),
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
                  children: [anounnment(sizediv)],
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
          )),
        ),
      ),
    );
  }

  Widget inputBox(String text, TextEditingController controller, IconData icon,
      bool obscureText, double sizediv) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        // height: sizediv * 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: sizediv,
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

  Widget anounnment(double sizediv) {
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
            : SizedBox(
                height: sizediv * 1.8,
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
