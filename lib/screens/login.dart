import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/locator.dart';
import 'package:it_intership_jobs_r2s/utils/routing/navigation_service.dart';
import 'package:it_intership_jobs_r2s/utils/routing/route_name.dart';

import '../utils/routing/navigation_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool circular = false;
  bool isChecked = false;
  bool isWrong = true;
  bool isFill = true;

  @override
  Widget build(BuildContext context) {
    double sizediv = MediaQuery.of(context).size.width / 39;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
            padding: EdgeInsets.only(top: sizediv * 10),
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
                    SizedBox(
                      height: sizediv,
                    ),
                    const Text(
                      "Đăng Nhập",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: sizediv * 5,
                    ),
                    inputBox(
                        "Tài khoản", _username, Icons.people, false, sizediv),
                    SizedBox(
                      height: sizediv * 3 / 2,
                    ),
                    inputBox("Mật khẩu", _password, Icons.key, true, sizediv),
                    SizedBox(
                      height: sizediv,
                    ),
                  ],
                ),
                checkBox(sizediv),
                SizedBox(
                  height: sizediv * 4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [anounnment()],
                  ),
                ),
                SizedBox(
                  height: sizediv,
                ),
                Center(
                    child: Column(
                  children: [
                    button("Đăng nhập", sizediv),
                    SizedBox(
                      height: sizediv * 2,
                    ),
                    link("Quên mật khẩu?", RegisterRoute),
                    SizedBox(
                      height: sizediv,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Bạn chưa có tài khoản?"),
                        link(" Đăng kí", RegisterRoute),
                      ],
                    ),
                    SizedBox(
                      height: sizediv * 4,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "images/google.jpg",
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )),
              ],
            )),
      ),
    );
  }

  Widget inputBox(String text, TextEditingController controller, IconData icon,
      bool obscureText, double sizediv) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: sizediv * 5,
      child: Padding(
        padding: EdgeInsets.only(left: sizediv * 1.4),
        child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(color: Color.fromARGB(255, 6, 2, 2)),
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
              labelText: text,
              labelStyle: const TextStyle(fontSize: 17, color: Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromARGB(255, 11, 230, 109))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromARGB(255, 139, 211, 168))),
            )),
      ),
    );
  }

  Widget checkBox(double sizediv) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color.fromARGB(255, 14, 223, 18);
    }

    return Padding(
      padding: EdgeInsets.only(left: sizediv * 1.7),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          const Text(
            "Lưu Mật Khẩu",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget anounnment() {
    double sizediv = MediaQuery.of(context).size.width / 39;
    return isFill == false
        ? Column(
            children: const [
              Text(
                "Vui lòng điền hết thông tin",
                style: TextStyle(color: Colors.red, fontSize: 15),
              )
            ],
          )
        : isWrong == false
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Đăng nhập sai tài khoản hoặc mật khẩu.",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  Text(
                    "Bạn còn 2 lần thử",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  )
                ],
              )
            : SizedBox(
                height: sizediv * 1.8,
              );
  }

  bool checkFillAll() {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      return false;
    }
    return true;
  }

  Widget button(String btnname, double sizediv) {
    return InkWell(
      onTap: () async {
        setState(() {
          //Kiểm tra đã điền username and password chưa
          if (_username.text.isEmpty || _password.text.isEmpty) {
            isFill = false;
          } else {
            locator<NavigationService>().globalNavigateTo(HomeRoute, context);
          }
          // circular = true;

          // Tạm thời
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
}
