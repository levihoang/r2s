import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class BoxWithLabel extends StatefulWidget {
  const BoxWithLabel({
    Key? key,
    required this.label,
    required this.textEditingController,
    required this.prefixicon,
    required this.hinttext,
    required this.ishide,
    required this.heightbox,
    required this.function,
    required this.suffixicon,
    required this.announcement,
  }) : super(key: key);
  final String label;
  final TextEditingController textEditingController;
  final IconData prefixicon;
  final IconData suffixicon;
  final String hinttext;
  final bool ishide;
  final double heightbox;
  final Function function;
  final String announcement;

  @override
  State<BoxWithLabel> createState() => _BoxWithLabelState();
}

class _BoxWithLabelState extends State<BoxWithLabel> {
  late bool _ishide;
  late String onchange = "";

  @override
  void initState() {
    super.initState();
    _ishide = widget.ishide;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(widget.label,
        //     style: GoogleFonts.openSans(
        //         fontSize: 16, color: textColor, fontWeight: FontWeight.bold)),
        TextField(
          onChanged: (value) {
            setState(() {
              onchange = value;
            });
          },
          obscureText: _ishide,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixicon),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            suffixIcon: IconButton(
              color: onchange != "" && widget.suffixicon != Icons.warning_amber
                  ? Colors.grey
                  : Colors.white,
              onPressed: () {
                setState(() {
                  _ishide = !_ishide;
                });
              },
              icon: !_ishide
                  ? Icon(widget.suffixicon)
                  : const Icon(Icons.visibility_off),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: yellowColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: widget.announcement == ""
                  ? const BorderSide(color: yellowColor)
                  : const BorderSide(color: Colors.red),
            ),
            hintText: widget.hinttext,
          ),
        ),
        widget.announcement == ""
            ? Container(
                height: 20,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.announcement,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
        // const SizedBox(
        //   height: 20,
        // )
      ],
    );
  }
}
