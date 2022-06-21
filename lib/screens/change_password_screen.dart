import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/screens/widgets/box_with_label.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';
import 'package:it_intership_jobs_r2s/validates/validate.dart';

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
  String currentPassAnnounce = "";
  String newPassAnnounce = "";
  String prePassAnnounce = "";

  String mess = '';

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    reNewPassword.dispose();
    super.dispose();
  }

  bool checkConditionCallChangePasswordAPI() {
    if (Validate.checkInvalidateNewPassword(newPassword.text) == true) {
      setState(() {
        newPassAnnounce =
            "Mật khẩu phải chứa ít nhất 1 chữ hoa,chữ thường, kí tự đặc biệt, số và chứa từ 6 kí tự";
      });
      return false;
    }

    if (Validate.checkNotEqualNewPassword(
            newPassword.text, reNewPassword.text) ==
        true) {
      setState(() {
        prePassAnnounce = "Mật khẩu phải trùng với mật khẩu mới";
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      label: "Nhập mật khẩu hiện tại",
                      textEditingController: currentPassword,
                      prefixicon: Icons.key,
                      hinttext: "Nhập mật khẩu hiện tại",
                      ishide: true,
                      heightbox: 30,
                      suffixicon: Icons.remove_red_eye,
                      function: () {
                        showCurrentPassword != showCurrentPassword;
                      },
                      announcement: currentPassAnnounce,
                    ),
                    BoxWithLabel(
                      label: "Nhập mật khẩu mới",
                      textEditingController: newPassword,
                      prefixicon: Icons.key,
                      hinttext: "Nhập mật khẩu mới",
                      ishide: true,
                      heightbox: 30,
                      function: () {
                        showNewPassword != showNewPassword;
                      },
                      suffixicon: Icons.remove_red_eye,
                      announcement: newPassAnnounce,
                    ),
                    BoxWithLabel(
                        label: "Nhập lại mật khẩu mới",
                        textEditingController: reNewPassword,
                        prefixicon: Icons.key,
                        hinttext: "Nhập lại mật khẩu mới",
                        ishide: true,
                        heightbox: 30,
                        function: () {
                          !showReNewPassword;
                        },
                        suffixicon: Icons.remove_red_eye,
                        announcement: prePassAnnounce),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          mess,
                          style: const TextStyle(color: redColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          clear();
                          if (checkFillAll()) {
                            if (checkConditionCallChangePasswordAPI()) {
                              log('Thành công');
                            } else {
                              log('Thất bại');
                            }
                          } else {
                            mess = "Vui lòng nhập đầy đủ thông tin";
                          }
                        });
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
                                style:
                                    TextStyle(color: whiteColor, fontSize: 18),
                              ),
                            ),
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
      ),
    );
  }

  bool checkFillAll() {
    if (currentPassword.text.isEmpty ||
        newPassword.text.isEmpty ||
        reNewPassword.text.isEmpty) {
      return false;
    }
    return true;
  }

  clear() {
    newPassAnnounce = "";
    prePassAnnounce = "";
    currentPassAnnounce = "";
    mess = "";
  }
}
