import 'package:flutter/material.dart';

import 'change_password_screen.dart';
import '../widgets/navigate_box.dart';
import '../widgets/option_box.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text("Cài đặt ứng dụng"),
        ),
        body: Column(
          children: const [
            OptionBox(
              title: "Bảo mật tài khoản",
              enable: false,
            ),
            NavigatorBox(
              function: ChangePasswordScreen(),
              title: "Đổi mật khẩu",
            ),
            OptionBox(
              title: "Thông tin ứng dụng",
              enable: false,
            ),
            NavigatorBox(
              // function: ChangePasswordScreen(),
              title: "Điều khoản dịch vụ",
            ),
            NavigatorBox(
              // function: ChangePasswordScreen(),
              title: "Chính sách bảo mật",
            ),
            NavigatorBox(
              // function: ChangePasswordScreen(),
              title: "Trợ giúp",
            ),
            NavigatorBox(
              // function: ChangePasswordScreen(),
              title: "Đánh giá ứng dụng",
            ),
            NavigatorBox(
              // function: ChangePasswordScreen(),
              title: "Phiên bản",
            ),
          ],
        ));
  }
}
