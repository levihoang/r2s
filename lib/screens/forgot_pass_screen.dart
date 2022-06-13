import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/screens/otp_page.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';

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
    return Center(
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
                    child: EnterMailPage(
                      mess: mess,
                      mailController: mailController,
                    )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Quay về'),
              SizedBox(
                width: 5,
              ),
              Text(
                'Đăng nhập',
                style:
                    TextStyle(color: yellowColor, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

class EnterMailPage extends StatefulWidget {
  EnterMailPage({super.key, required this.mess, required this.mailController});
  String mess;
  TextEditingController mailController;
  @override
  State<EnterMailPage> createState() => _EnterMailPageState();
}

class _EnterMailPageState extends State<EnterMailPage> {
  bool invalidateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  bool emptyInput(String? value) {
    if (value == null) {
      return true;
    }
    if (value.isEmpty) {
      return true;
    }
    if (value.trim() == '') {
      return true;
    }
    return false;
  }

  bool checkInputBox() {
    if (emptyInput(widget.mailController.text)) {
      widget.mess = '*Nhập thiếu';
      return false;
    }
    if (invalidateEmail(widget.mailController.text)) {
      widget.mess = '*Mail không hợp lệ';
      return false;
    }
    widget.mess = '';
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Center(
          child: Text(
            'ITInternship Job',
            style: TextStyle(fontSize: 30),
          ),
        ),
        const Center(
          child: Text(
            'Quên mật khẩu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        BoxWithLabel(
            label: 'Email', textEditingController: widget.mailController),
        Center(
          child: InkWell(
            onTap: () {
              if (checkInputBox()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OTPPage()),
                );
              }
              setState(() {});
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                color: yellowColor,
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Gửi mã OTP')),
              ),
            ),
          ),
        ),
        Text(
          widget.mess,
          style: const TextStyle(
            color: redColor,
          ),
        )
      ],
    );
  }
}

class BoxWithLabel extends StatefulWidget {
  const BoxWithLabel({
    Key? key,
    required this.label,
    required this.textEditingController,
  }) : super(key: key);
  final String label;
  final TextEditingController textEditingController;

  @override
  State<BoxWithLabel> createState() => _BoxWithLabelState();
}

class _BoxWithLabelState extends State<BoxWithLabel> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: GoogleFonts.openSans(
                fontSize: 20, color: textColor, fontWeight: FontWeight.bold)),
        TextField(
          controller: widget.textEditingController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: yellowColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: yellowColor),
            ),
            hintText: 'Nhập vào đây',
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
