import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

import 'package:it_intership_jobs_r2s/screens/forgot_pass_screen.dart';
import 'package:it_intership_jobs_r2s/screens/widgets/box_with_label.dart';
import 'package:it_intership_jobs_r2s/services/remote_service.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';
import 'package:it_intership_jobs_r2s/validates/validate.dart';

import '../services/register_api.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _usernameReg = TextEditingController();
  final TextEditingController _passwordReg = TextEditingController();
  final TextEditingController _confirmPasswordReg = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool isSignupScreen = false;
  bool isMale = true;
  bool isRememberMe = false;
  bool isWrong = true;
  bool isFill = true;

  String _usernameLogAnnounce = "";
  String _passwordLogA = "";
  String loginAnnounce = "";

  String _registerAnnounce = "";
  String _usernameannounce = "";
  String _passRegannounce = "";
  String _repassAnnounce = "";
  String _emailAnnounce = "";

  _register() async {
    Map data = {
      "username": _usernameReg.text,
      "password": _passwordReg.text,
      "confirmPassword": _confirmPasswordReg.text,
      "role": {
        "id": 3,
      },
      "email": _email.text,
    };
    print(data);
    String body = json.encode(data);

    var response = await RemoteService.postHTTP("/api/user/add", data);
    var myResponse = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      setState(() {
        isSignupScreen = false;
        _username.text = _usernameReg.text;
        _password.text = _passwordReg.text;
      });
    } else {
      setState(() {
        if (myResponse["Email"].toString() != "null" &&
            myResponse["Username"].toString() != "null") {
          _emailAnnounce = myResponse["Email"].toString();
          _usernameannounce = myResponse["Username"].toString();
        } else {
          if (myResponse["Email"].toString() != "null") {
            _emailAnnounce = myResponse["Email"].toString();
          } else {
            _usernameannounce = myResponse["Username"].toString();
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 39;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/logo_company.png"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  color: const Color(0xFF3b5999).withOpacity(.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [],
                  ),
                ),
              ),
            ),
            buildBottomHalfContainer(true),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              top: isSignupScreen ? 100 : 130,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                height: isSignupScreen ? 500 : 330,
                padding: const EdgeInsets.all(20),
                width: size * 35,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5),
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                clear();
                                clearText();
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen
                                          ? activeColor
                                          : textColor1),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                clear();
                                clearText();
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Đăng kí",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen
                                          ? activeColor
                                          : textColor1),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (isSignupScreen) buildSignupSection(),
                      if (!isSignupScreen) buildSigninSection()
                    ],
                  ),
                ),
              ),
            ),
            // Trick to add the submit button
            buildBottomHalfContainer(false),
            // Bottom buttons
            Positioned(
              top: MediaQuery.of(context).size.height - 300,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(
                    isSignupScreen ? "" : "Hoặc đăng nhập với",
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        isSignupScreen
                            ? Container(
                                height: 50,
                              )
                            : buildTextButton(
                                MaterialCommunityIcons.google_plus,
                                "Google",
                                googleColor),
                      ],
                    ),
                  ),
                  const Center(
                    child: Text("Công ty cổ phần R2S"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          BoxWithLabel(
            textEditingController: _username,
            prefixicon: Icons.people_alt,
            hinttext: "Tên đăng nhập",
            ishide: false,
            function: () {},
            suffixicon: Icons.warning_amber,
            announcement: _usernameLogAnnounce,
          ),
          BoxWithLabel(
            textEditingController: _password,
            prefixicon: MaterialCommunityIcons.lock_outline,
            hinttext: "Nhập mật khẩu",
            ishide: true,
            function: () {},
            suffixicon: Icons.remove_red_eye,
            announcement: _passwordLogA,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              loginAnnounce,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text("Lưu mật khẩu",
                      style: TextStyle(fontSize: 15, color: textColor1))
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen()),
                  );
                },
                child: const Text("Quên mật khẩu?",
                    style: TextStyle(fontSize: 15, color: textColor1)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          BoxWithLabel(
              textEditingController: _usernameReg,
              prefixicon: Icons.people,
              hinttext: "Nhập tên đăng nhập",
              ishide: false,
              function: () {},
              suffixicon: Icons.warning_amber,
              announcement: _usernameannounce),
          BoxWithLabel(
              textEditingController: _passwordReg,
              prefixicon: Icons.key,
              hinttext: "Nhập mật khẩu",
              ishide: true,
              function: () {},
              suffixicon: Icons.remove_red_eye,
              announcement: _passRegannounce),
          BoxWithLabel(
              textEditingController: _confirmPasswordReg,
              prefixicon: Icons.key,
              hinttext: "Xác nhận lại mật khẩu",
              ishide: true,
              function: () {},
              suffixicon: Icons.remove_red_eye,
              announcement: _repassAnnounce),
          BoxWithLabel(
              textEditingController: _email,
              prefixicon: Icons.email,
              hinttext: "Nhập email",
              ishide: false,
              function: () {},
              suffixicon: Icons.warning_amber,
              announcement: _emailAnnounce),
          Center(
            child: Text(
              _registerAnnounce,
              style: const TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () async {
        if (isSignupScreen) {
          setState(() {
            registerApi();
          });
        } else {
          loginApi();
        }
      },
      style: TextButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.grey),
          minimumSize: const Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  loginApi() {
    clear();
    setState(() {
      bool checklength =
          _username.text.length >= 6 && _password.text.length < 250;
      if (checkFillLogin()) {
        if (checklength) {
        } else {
          _usernameLogAnnounce = "Tài khoản phải chứa từ 6 kí tự";
        }
      } else {
        loginAnnounce = "Vui lòng điền hết thông tin";
      }
    });
  }

  registerApi() {
    clear();
    setState(() {
      bool checklength =
          _usernameReg.text.length >= 6 && _usernameReg.text.length < 250;
      bool validPass = validPassword(_passwordReg.text);
      bool isMatch = _passwordReg.text == _confirmPasswordReg.text;
      bool validEmail = Validate.invalidateEmail(_email.text);
      if (checkFillRgister()) {
        if (checklength) {
        } else {
          _usernameannounce = "Tài khoản phải chứa từ 6 kí tự";
        }
        if (validPass) {
        } else {
          _passRegannounce =
              "Mật khẩu phải chứa ít nhất 1 chữ hoa, chữ thường, kí tự đặc biệt, số và chứa từ 6 kí tự";
        }
        if (isMatch) {
        } else {
          _repassAnnounce = "Xác nhận mật khẩu sai";
        }
        if (validEmail == false) {
        } else {
          _emailAnnounce = "Email không không đúng định dạng";
        }
      } else {
        _registerAnnounce = "Vui lòng điền hết thông tin";
      }
      if (checkFillRgister() &&
          checklength &&
          validPass &&
          isMatch & validEmail == false) {
        _register();
      }
    });
  }

  bool checkFillLogin() {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool checkFillRgister() {
    if (_usernameReg.text.isEmpty ||
        _passwordReg.text.isEmpty ||
        _confirmPasswordReg.text.isEmpty ||
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

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 555 : 410,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange.shade400, Colors.red.shade400],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1))
                      ]),
                  child: InkWell(
                    onTap: () => {
                      if (isSignupScreen)
                        {
                          setState(() {
                            registerApi();
                          }),
                        }
                      else
                        {
                          loginApi(),
                        }
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              : const Center(),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController attribute, IconData icon,
      IconData suficon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: attribute,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(suficon)),
          suffixIconColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: textColor1),
        ),
      ),
    );
  }

  clearText() {
    _username.clear();
    _password.clear();

    _passwordReg.clear();
    _usernameReg.clear();
    _email.clear();
    _confirmPasswordReg.clear();
  }

  clear() {
    _passwordLogA = "";
    _usernameLogAnnounce = "";
    _registerAnnounce = "";
    loginAnnounce = "";
    _emailAnnounce = "";
    _passRegannounce = "";
    _repassAnnounce = "";
    _usernameannounce = "";
  }
}
