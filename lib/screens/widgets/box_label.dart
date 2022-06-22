import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';

abstract class BoxLabel extends StatefulWidget {
  const BoxLabel({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.hintText,
    this.announcementColor,
    required this.textEditingController,
    this.obscure,
    this.borderColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.sizeText,
  });
  final double? verticalPadding;
  final double? horizontalPadding;
  final IconButton? prefixIcon;
  final IconButton? suffixIcon;
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
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          obscureText: widget.obscure ?? false,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding ?? 20,
                vertical: widget.verticalPadding ?? 0),
            suffixIcon: widget.suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.borderColor ?? yellowColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.borderColor ?? yellowColor),
            ),
            hintText: widget.hintText,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.announcement(widget.textEditingController.text) ?? '',
          style: TextStyle(color: widget.announcementColor),
        )
      ],
    );
  }
}
