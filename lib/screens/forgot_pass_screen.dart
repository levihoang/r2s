import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/otp_page.dart';
import 'package:it_intership_jobs_r2s/screens/widgets/box_with_label.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';
import 'package:it_intership_jobs_r2s/validates/validate.dart';

import 'change_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController mailController = TextEditingController();
  String mess = '';

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lấy lại mật khẩu"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Wrap(
                      children: [
                        const Center(
                          child: Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Column(
                          children: [
                            Center(
                              child: Text(
                                'Nhập email của bạn vào ô phía dưới để được hướng dẫn lấy lại mật khẩu',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        BoxWithLabel(
                          textEditingController: mailController,
                          prefixicon: Icons.email,
                          hinttext: "Nhập email",
                          ishide: false,
                          function: () {},
                          suffixicon: Icons.warning_amber,
                          announcement: mess,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              if (mailController.text.isEmpty) {
                                mess = "Vui lòng nhập email";
                                setState(() {});
                                return;
                              }

                              if (Validate.invalidateEmail(
                                  mailController.text)) {
                                mess = 'Mail không hợp lệ';
                                setState(() {});
                                return;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTPPage(
                                          email: mailController.text,
                                        )),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                color: yellowColor,
                                child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text('Gửi mã OTP')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
