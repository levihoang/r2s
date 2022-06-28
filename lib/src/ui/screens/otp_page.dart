import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key, required this.email});
  final String email;
  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  var time_down = 44;
  final int TIME_MAX = 45;
  late Timer _timer;
  TextEditingController opt_1 = TextEditingController();
  TextEditingController opt_2 = TextEditingController();
  TextEditingController opt_3 = TextEditingController();
  TextEditingController opt_4 = TextEditingController();

  String getOTP() {
    String otpStr = '';
    otpStr += opt_1.text + opt_2.text + opt_3.text + opt_4.text;
    return otpStr.length != 4 ? '' : otpStr;
  }

  _textFieldOTP(bool first, bool last, otp) {
    return SizedBox(
      height: 85,
      width: MediaQuery.of(context).size.width / 6,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
            autofocus: true,
            controller: otp,
            onChanged: (value) {
              // if (value == '' && first != true) {
              //   FocusScope.of(context).previousFocus();
              // }
              if (value.length == 1 && last != true) {
                FocusScope.of(context).nextFocus();
              }
              if (value == '' && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: grayColor),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: yellowColor),
                  borderRadius: BorderRadius.circular(12)),
            )),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (time_down == 0) {
          timer.cancel();
          setState(() {});
          time_down = TIME_MAX;
        } else {
          time_down--;
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grayColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: whiteColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'ITIntership Job',
                          style: GoogleFonts.openSans(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text('Quên mật khẩu',
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const Center(
                          child: Text('Chúng tôi đã gửi mã đến địa chỉ email')),
                      Center(
                        child: Text(
                          widget.email,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 20,
                        width: double.infinity,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _textFieldOTP(true, false, opt_1),
                          const SizedBox(
                            width: 5,
                          ),
                          _textFieldOTP(false, false, opt_2),
                          const SizedBox(
                            width: 5,
                          ),
                          _textFieldOTP(false, false, opt_3),
                          const SizedBox(
                            width: 5,
                          ),
                          _textFieldOTP(false, true, opt_4),
                        ],
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            log('Lấy lại mật khẩu CLICK');
                            log(getOTP());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                color: yellowColor,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Text(
                                      'Lấy lại mật khẩu',
                                      style: GoogleFonts.openSans(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold),
                                    ))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      time_down != TIME_MAX
                          ? Center(child: Text('Gửi lại mã sau $time_down s'))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Không nhận được OTP?'),
                                InkWell(
                                    onTap: () {
                                      startTimer();
                                      setState(() {});
                                    },
                                    child: const Text(
                                      'Gửi lại OTP',
                                      style: TextStyle(
                                        color: yellowColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ),
                      const SizedBox(
                        height: 40,
                        width: double.infinity,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Quay về'),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Đăng nhập',
                              style: TextStyle(
                                  color: yellowColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
