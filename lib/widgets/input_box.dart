import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox(
      {Key? key,
      required this.btnname,
      required this.size,
      required this.controller,
      required this.obscureText})
      : super(key: key);
  final String btnname;
  final double size;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<InputBox> createState() => _InputBoxState();
}

@override
void initState() {}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: widget.size * 39 - 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.btnname,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.grey[600]),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: widget.controller,
                obscureText: widget.obscureText,
                style: const TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
}
