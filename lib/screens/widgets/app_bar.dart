import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';

class AppBarR2s extends StatelessWidget implements PreferredSizeWidget {
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
  final iconCLick;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor ?? yellowColor,
      bottomOpacity: 0.0,
      elevation: 0.0,
      // foregroundColor: yellowColor,
      toolbarHeight: 50,
      title: Text(
        title ?? '',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        InkWell(
          onTap: iconCLick,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(iconData),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
