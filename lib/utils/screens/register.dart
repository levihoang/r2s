import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
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
                      inputBox("Xác nhận mật khẩu", _password, Icons.key, true),
                      const SizedBox(
                        height: 10,
                      ),
                      inputBox("Email", _password, Icons.key, true),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
                        link("Đăng nhập"),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: controller,
                obscureText: obscureText,
                style: const TextStyle(color: Colors.white),
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
