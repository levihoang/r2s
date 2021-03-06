import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';
import 'package:it_intership_jobs_r2s/src/ui/base/base_viewmodel.dart';

import '../../helper/validate.dart';
import '../../utils/colors.dart';
import 'forgot_pass_screen.dart';
import '../widgets/box_with_label.dart';

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
  int addSize = 0;
  double addValue = 0;
  bool loginSuccess = false;
  bool registerSuccess = false;

  String _usernameLogAnnounce = "";
  String _passwordLogA = "";
  String loginAnnounce = "";

  String _registerAnnounce = "";
  String _usernameannounce = "";
  String _passRegannounce = "";
  String _repassAnnounce = "";
  String _emailAnnounce = "";

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 39;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 650,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
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
                    buildBottomHalfContainer(true),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.bounceInOut,
                      top: isSignupScreen ? 100 : 130,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.bounceInOut,
                        height: isSignupScreen
                            ? (430 + addValue)
                            : (330 + addValue),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        addValue = 0;
                                        clear();
                                        clearText();
                                        isSignupScreen = false;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "????ng nh???p",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: !isSignupScreen
                                                  ? activeColor
                                                  : textColor1),
                                        ),
                                        if (!isSignupScreen)
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 3),
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
                                        addValue = 0;
                                        clear();
                                        clearText();
                                        isSignupScreen = true;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "????ng k??",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: isSignupScreen
                                                  ? activeColor
                                                  : textColor1),
                                        ),
                                        if (isSignupScreen)
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 3),
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
                    buildBottomHalfContainer(false),
                    // Bottom buttons
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    isSignupScreen ? "" : "Ho???c ????ng nh???p v???i",
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
                    child: Text("C??ng ty c??? ph???n R2S"),
                  )
                ],
              )
            ],
          ),
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
            hinttext: "T??n ????ng nh???p",
            ishide: false,
            function: () {},
            suffixicon: Icons.warning_amber,
            announcement: _usernameLogAnnounce,
          ),
          BoxWithLabel(
            textEditingController: _password,
            prefixicon: MaterialCommunityIcons.lock_outline,
            hinttext: "Nh???p m???t kh???u",
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
                  const Text("L??u m???t kh???u",
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
                child: const Text("Qu??n m???t kh???u?",
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
              hinttext: "Nh???p t??n ????ng nh???p",
              ishide: false,
              function: () {},
              suffixicon: Icons.warning_amber,
              announcement: _usernameannounce),
          BoxWithLabel(
              textEditingController: _passwordReg,
              prefixicon: Icons.key,
              hinttext: "Nh???p m???t kh???u",
              ishide: true,
              function: () {},
              suffixicon: Icons.remove_red_eye,
              announcement: _passRegannounce),
          BoxWithLabel(
              textEditingController: _confirmPasswordReg,
              prefixicon: Icons.key,
              hinttext: "X??c nh???n l???i m???t kh???u",
              ishide: true,
              function: () {},
              suffixicon: Icons.remove_red_eye,
              announcement: _repassAnnounce),
          BoxWithLabel(
              textEditingController: _email,
              prefixicon: Icons.email,
              hinttext: "Nh???p email",
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

  Controller loginController = Get.put(Controller());

  loginApi() async {
    addValue = 0;
    clear();

    bool checklength =
        _username.text.length >= 6 && _password.text.length < 250;
    if (checkFillLogin()) {
      if (checklength) {
        if (await loginController.isSucceedSignIn(
                username: _username.text, password: _password.text) ==
            true) {
          loginController.changeSelectedIndex(0);

          Get.back();
        } else {
          loginAnnounce = "Sai t??i kho???n ho???c m???t kh???u";
        }
      } else {
        _usernameLogAnnounce = "T??i kho???n ph???i ch???a t??? 6 k?? t???";
        addValue += 10;
      }
    } else {
      loginAnnounce = "Vui l??ng ??i???n h???t th??ng tin";
    }
    setState(() {});
  }

  _register() async {
    String? announcement = await Controller().isAnnouncementRegister(
      username: _usernameReg.text,
      password: _passwordReg.text,
      email: _email.text,
    );

    if (announcement == null) {
      setState(() {
        isSignupScreen = false;
        _username.text = _usernameReg.text;
        _password.text = _passwordReg.text;
        Flushbar(
          title: "Th??ng b??o",
          message: "????ng k?? th??nh c??ng",
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.elasticOut,
          backgroundColor: Colors.red,
          boxShadows: const [
            BoxShadow(
                color: Colors.orange, offset: Offset(0.0, 2.0), blurRadius: 3.0)
          ],
          backgroundGradient:
              const LinearGradient(colors: [Colors.white, Colors.yellow]),
          isDismissible: false,
          duration: const Duration(seconds: 4),
          icon: const Icon(
            Icons.check,
            color: Colors.black,
          ),
          showProgressIndicator: true,
          progressIndicatorBackgroundColor: Colors.blueGrey,
          titleText: const Text(
            "Th??ng b??o",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
                fontFamily: "ShadowsIntoLightTwo"),
          ),
          messageText: const Text(
            "Ch??c m???ng b???n ???? ????ng k?? th??nh c??ng",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: "ShadowsIntoLightTwo"),
          ),
        ).show(context);
      });
    } else {
      log(announcement);
      setState(() {
        _registerAnnounce = announcement;
        addValue += 20;
      });
    }
  }

  registerApi() {
    addValue = 0;

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
          _usernameannounce = "T??i kho???n ph???i ch???a t??? 6 k?? t???";
          addValue += 10;
        }
        if (validPass) {
        } else {
          _passRegannounce =
              "M???t kh???u ph???i ch???a ??t nh???t 1 ch??? hoa, ch??? th?????ng, k?? t??? ?????c bi???t, s??? v?? ch???a t??? 6 k?? t???";
          addValue += 20;
        }
        if (isMatch) {
        } else {
          _repassAnnounce = "X??c nh???n m???t kh???u sai";
          addValue += 10;
        }
        if (validEmail == false) {
        } else {
          _emailAnnounce = "Email kh??ng kh??ng ????ng ?????nh d???ng";
          addValue += 10;
        }
      } else {
        _registerAnnounce = "Vui l??ng ??i???n h???t th??ng tin";
      }
      bool check = checkFillRgister() == true &&
          checklength &&
          validPass &&
          isMatch &&
          validEmail == false;
      if (check) {
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
      top: isSignupScreen ? (480 + addValue) : (410 + addValue),
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
