import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/screens/detail_post_screen.dart';

import '../../utils/colors.dart';

class SignInAndOutBox extends StatefulWidget {
  const SignInAndOutBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInAndOutBox> createState() => _SignInAndOutBox();
}

class _SignInAndOutBox extends State<SignInAndOutBox> {
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool _ishide = false;

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: AutofillGroup(
              child: Column(children: [
                TextFormField(
                  onChanged: (value) {},
                  autofillHints: const [AutofillHints.email],
                  onEditingComplete: () => TextInput.finishAutofillContext(),
                  obscureText: false,
                  controller: userController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: yellowColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                TextFormField(
                  autofillHints: const [AutofillHints.password],
                  onEditingComplete: () => TextInput.finishAutofillContext(),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (password) =>
                      password != null && password.length < 5
                          ? "Enter min.5 characters"
                          : null,
                  onChanged: (value) {},
                  obscureText: _ishide,
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _ishide = !_ishide;
                        },
                        icon: _ishide
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility)),
                    prefixIcon: const Icon(Icons.password),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: yellowColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final form = formKey.currentState!;

                    if (form.validate()) {
                      TextInput.finishAutofillContext();
                      final username = userController.text;
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("Your email is $username")));
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: yellowColor,
                      child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text('Đăng nhập')),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
