import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

abstract class BoxLabel extends StatefulWidget {
  const BoxLabel({
    super.key,
    this.iconColor,
    this.hintText,
    this.announcementColor,
    required this.textEditingController,
    this.obscure,
    this.borderColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.sizeText,
    this.title,
    this.suffixIcon,
  });
  final String? title;
  final double? verticalPadding;
  final double? horizontalPadding;
  final IconButton? Function()? suffixIcon;
  final Color? borderColor;
  final Color? iconColor;
  final String? hintText;
  final Color? announcementColor;
  final bool? obscure;
  final double? sizeText;

  String? announcement(String value);
  final TextEditingController textEditingController;

  @override
  State<BoxLabel> createState() => BoxLabelState();
}

class BoxLabelState extends State<BoxLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? Container()
            : Text(widget.title ?? '',
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          obscureText: widget.obscure ?? false,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            // prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding ?? 20,
                vertical: widget.verticalPadding ?? 0),
            suffixIcon: widget.suffixIcon == null ? null : widget.suffixIcon!(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: widget.borderColor ?? darkBlueColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: widget.borderColor ?? darkBlueColor),
            ),
            hintText: widget.hintText,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        widget.textEditingController.text == ''
            ? Container()
            : Text(
                widget.announcement(widget.textEditingController.text) ?? '',
                style: TextStyle(color: widget.announcementColor ?? redColor),
              )
      ],
    );
  }
}
