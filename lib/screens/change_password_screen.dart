import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController reNewPassword = TextEditingController();

  bool showCurrentPassword = false;
  bool showNewPassword = false;
  bool showReNewPassword = false;
  String mess = '';

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    reNewPassword.dispose();
    super.dispose();
  }

  bool checkEmptyBox() {
    if (currentPassword.text == '' ||
        newPassword.text == '' ||
        reNewPassword.text == '') {
      mess = '*Nhập thiếu';
      return true;
    }
    return false;
  }

  bool checkInvalidateNewPassword() {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (!regex.hasMatch(newPassword.text)) {
      return true;
    } else {
      return false;
    }
  }

  bool checkNotEqualNewPassword() {
    if (newPassword.text != reNewPassword.text) {
      return false;
    }
    return true;
  }

  bool checkInputBox() {
    if (checkEmptyBox()) {
      mess = '*Nhập thiếu';
      return false;
    }

    if (checkInvalidateNewPassword()) {
      mess =
          '*Mật khẩu mới có ít nhất 8 ký tự: cần có chữ hoa, chữ thường và số';
      return false;
    }

    if (checkNotEqualNewPassword()) {
      mess = '*Mật khẩu mới không khớp';
      return false;
    }

    mess = '';
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: whiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Wrap(
              children: [
                Center(
                  child: Text('Đổi mật khẩu',
                      style: GoogleFonts.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: yellowColor,
                      )),
                ),
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                BoxWithLabel(
                  label: 'Mật khẩu hiện tại',
                  textEditingController: currentPassword,
                ),
                const SizedBox(height: 20),
                BoxWithLabel(
                  label: 'Nhập mật khẩu mới',
                  textEditingController: newPassword,
                ),
                const SizedBox(height: 20),
                BoxWithLabel(
                  label: 'Nhập lại mật khẩu mới',
                  textEditingController: reNewPassword,
                ),
                InkWell(
                  onTap: () {
                    if (checkInputBox()) {
                      log('InputBox thỏa');
                    } else {
                      log('InputBox KHÔNG thỏa');
                    }
                    setState(() {});
                  },
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: yellowColor,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'Đổi mật khẩu',
                            style: TextStyle(color: whiteColor, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                Text(
                  mess,
                  style: const TextStyle(color: redColor),
                ),
              ],
            ),
          ),
        ),
      ),
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
          obscureText: showPass,
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
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                showPass ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  showPass = !showPass;
                });
              },
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
