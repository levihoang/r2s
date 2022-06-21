import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

import 'package:it_intership_jobs_r2s/screens/forgot_pass_screen.dart';
import 'package:it_intership_jobs_r2s/screens/widgets/box_with_label.dart';
import 'package:it_intership_jobs_r2s/services/remote_service.dart';
import 'package:it_intership_jobs_r2s/validates/validate.dart';

import '../services/register_api.dart';
import 'config/palette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username_reg = TextEditingController();
  final TextEditingController _password_reg = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool isSignupScreen = false;
  bool isMale = true;
  bool isRememberMe = false;
  bool isWrong = true;
  bool isFill = true;
  String _loginAnnounce = "";
  String _registerAnnounce = "";
  String _usernameannounce = "";
  String _passRegannounce = "";
  String _repassAnnounce = "";
  String _emailAnnounce = "";

  _register() async {
    Map data = {
      "username": _username_reg.text,
      "password": _password_reg.text,
      "confirmPassword": _confirmPassword.text,
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
        _username.text = _username_reg.text;
        _password.text = _password_reg.text;
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
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 270,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("images/back_ground.png"),
              //         fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 100 : 130,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 500 : 420,
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
                                        ? Palette.activeColor
                                        : Palette.textColor1),
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
                                        ? Palette.activeColor
                                        : Palette.textColor1),
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
            top: MediaQuery.of(context).size.height - 150,
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
                          : buildTextButton(MaterialCommunityIcons.google_plus,
                              "Google", Palette.googleColor),
                    ],
                  ),
                ),
                const Center(
                  child: Text("Công ty cổ phầnn R2S"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          BoxWithLabel(
              label: "Tên đăng nhập",
              textEditingController: _username_reg,
              prefixicon: Icons.people_alt,
              hinttext: "Nhập tên đăng nhập",
              ishide: false,
              heightbox: 30,
              function: () {},
              suffixicon: Icons.warning_amber,
              announcement: ""),
          BoxWithLabel(
              label: "Mật Khẩu",
              textEditingController: _password,
              prefixicon: MaterialCommunityIcons.lock_outline,
              hinttext: "Nhập mật khẩu",
              ishide: true,
              heightbox: 30,
              function: () {},
              suffixicon: Icons.remove_red_eye,
              announcement: _loginAnnounce),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text("Lưu mật khẩu",
                      style: TextStyle(fontSize: 15, color: Palette.textColor1))
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
                    style: TextStyle(fontSize: 15, color: Palette.textColor1)),
              )
            ],
          ),
          Center(
            child: Text(
              _loginAnnounce,
              style: const TextStyle(color: Colors.red),
            ),
          )
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
              label: "Tên đăng nhập",
              textEditingController: _username_reg,
              prefixicon: Icons.people,
              hinttext: "Nhập tên đăng nhập",
              ishide: false,
              heightbox: 30,
              function: () {},
              suffixicon: Icons.warning_amber,
              announcement: _usernameannounce),
          BoxWithLabel(
              label: "Mật khẩu",
              textEditingController: _password_reg,
              prefixicon: Icons.key,
              hinttext: "Nhập mật khẩu",
              ishide: true,
              heightbox: 30,
              function: () {},
              suffixicon: Icons.remove_red_eye,
              announcement: _passRegannounce),
          BoxWithLabel(
              label: "Xác nhận lại mật khẩu ",
              textEditingController: _confirmPassword,
              prefixicon: Icons.key,
              hinttext: "Xác nhận lại mật khẩu",
              ishide: true,
              heightbox: 30,
              function: () {},
              suffixicon: Icons.remove_red_eye,
              announcement: _repassAnnounce),
          BoxWithLabel(
              label: "Email",
              textEditingController: _email,
              prefixicon: Icons.email,
              hinttext: "Nhập email",
              ishide: false,
              heightbox: 30,
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
        } else {}
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

  registerApi() {
    clear();
    setState(() {
      bool checklength =
          _username_reg.text.length >= 6 && _username_reg.text.length < 250;
      bool validPass = validPassword(_password_reg.text);
      bool isMatch = _password_reg.text == _confirmPassword.text;
      bool validEmail = Validate.invalidateEmail(_email.text);
      if (checkFillRgister()) {
        if (checklength) {
        } else {
          _usernameannounce = "Tài khoản phải chứa từ 6 kí tự";
        }
        if (validPass) {
        } else {
          _passRegannounce =
              "Mật khẩu phải chứa ít nhất 1 chữ hoa,chữ thường, kí tự đặc biệt, số và chứa từ 6 kí tự";
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

  bool checkFillRgister() {
    if (_username_reg.text.isEmpty ||
        _password_reg.text.isEmpty ||
        _confirmPassword.text.isEmpty ||
        _email.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool checkFillLogin() {
    if (_username.text.isEmpty || _password.text.isEmpty) {
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
      top: isSignupScreen ? 555 : 500,
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
                    onTap: () => {registerApi()},
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
            color: Palette.iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }

  clear() {
    _registerAnnounce = "";
    _loginAnnounce = "";
    _emailAnnounce = "";
    _passRegannounce = "";
    _repassAnnounce = "";
    _usernameannounce = "";
  }
}
