import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String mess = '';

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    reNewPassword.dispose();
    super.dispose();
  }

  bool checkConditionCallChangePasswordAPI() {
    if (Validate.checkInvalidateNewPassword(newPassword.text) == false &&
        Validate.checkNotEqualNewPassword(
                newPassword.text, reNewPassword.text) ==
            false &&
        Validate.checkInvalidateNewPassword(currentPassword.text) == false) {
      log('Thỏa điều kiện gọi API');
      return true;
    } else {
      log('Không thỏa điều kiện gọi API');
      return false;
    }
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
                NewPassBoxWithLabel(
                  label: 'Nhập mật khẩu mới',
                  textEditingController: newPassword,
                ),
                const SizedBox(height: 20),
                ConfirmBoxWithLabel(
                  label: 'Nhập lại mật khẩu mới',
                  newPassword: newPassword,
                  textEditingController: reNewPassword,
                ),
                InkWell(
                  onTap: () {
                    if (checkConditionCallChangePasswordAPI()) {
                      log('Thành công');
                    } else {
                      log('Thất bại');
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

class NewPassBoxWithLabel extends StatefulWidget {
  const NewPassBoxWithLabel({
    Key? key,
    required this.label,
    required this.textEditingController,
  }) : super(key: key);
  final String label;
  final TextEditingController textEditingController;
  @override
  State<NewPassBoxWithLabel> createState() => NewPassBoxWithLabelState();
}

class NewPassBoxWithLabelState extends State<NewPassBoxWithLabel> {
  bool showPass = true;
  String mess = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: GoogleFonts.openSans(
                fontSize: 20, color: textColor, fontWeight: FontWeight.bold)),
        TextField(
          onChanged: (value) {
            if (Validate.checkInvalidateNewPassword(value) && value != '') {
              mess =
                  'Mật khẩu phải có ký tự hoa, ký tự thường, viết hoa và ít nhất 8 ký tự';
            } else {
              mess = '';
            }
            setState(() {});
          },
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
        Text(
          mess,
          style: const TextStyle(color: redColor),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class ConfirmBoxWithLabel extends StatefulWidget {
  const ConfirmBoxWithLabel({
    Key? key,
    required this.label,
    required this.textEditingController,
    required this.newPassword,
  }) : super(key: key);
  final String label;
  final TextEditingController newPassword;
  final TextEditingController textEditingController;

  @override
  State<ConfirmBoxWithLabel> createState() => ConfirmBoxWithLabelState();
}

class ConfirmBoxWithLabelState extends State<ConfirmBoxWithLabel> {
  bool showPass = true;
  String mess = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: GoogleFonts.openSans(
                fontSize: 20, color: textColor, fontWeight: FontWeight.bold)),
        TextField(
          onChanged: (value) {
            log(value);
            if (Validate.checkNotEqualNewPassword(widget.newPassword.text,
                    widget.textEditingController.text) &&
                value != '') {
              mess = 'Không khớp';
            } else {
              mess = '';
            }
            setState(() {});
          },
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
        Text(
          mess,
          style: const TextStyle(color: redColor),
        ),
        const SizedBox(
          height: 20,
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
          textInputAction: TextInputAction.next,
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
