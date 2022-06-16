import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

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
