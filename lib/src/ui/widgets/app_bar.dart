import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class AppBarR2s extends StatefulWidget implements PreferredSizeWidget {
  const AppBarR2s({
    Key? key,
    this.title,
    this.iconData,
    this.iconCLick,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);
  final String? title;
  final IconData? iconData;
  // ignore: prefer_typing_uninitialized_variables
  final iconCLick;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  State<AppBarR2s> createState() => _AppBarR2sState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _AppBarR2sState extends State<AppBarR2s> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: widget.foregroundColor,
      backgroundColor: widget.backgroundColor ?? yellowColor,
      bottomOpacity: 0.0,
      elevation: 2.0,
      // foregroundColor: yellowColor,
      toolbarHeight: 50,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),

      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              widget.title ?? '',
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        InkWell(
          onTap: widget.iconCLick,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: widget.iconData == Icons.save
                ? const Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Text(
                      "Lưu",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  )
                : Icon(widget.iconData),
          ),
        )
      ],
    );
  }
}
