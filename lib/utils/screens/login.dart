import 'package:flutter/material.dart';

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
                mainAxisSize: MainAxisSize.min,
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
                        "Đăng Nhập",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      inputBox("Tài khoản", _username, Icons.people, false),
                      const SizedBox(
                        height: 10,
                      ),
                      inputBox("Mật khẩu", _password, Icons.key, true),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  checkBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  button("Đăng nhập"),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: link("Quên mật khẩu?"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        const Text("Bạn chưa có tài khoản?"),
                        link("Đăng kí"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: Image.asset(
                      "images/google.jpg",
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    ),
                  )
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
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.white),
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

  Widget checkBox() {
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
      padding: const EdgeInsets.only(left: 17),
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

  Widget button(String btnname) {
    return Padding(
      padding: const EdgeInsets.only(left: 110),
      child: InkWell(
        onTap: () async {
          setState(() {
            circular = true;
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

  Widget link(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        decoration: TextDecoration.underline,
        color: Color.fromARGB(255, 4, 174, 78),
      ),
    );
  }
}
