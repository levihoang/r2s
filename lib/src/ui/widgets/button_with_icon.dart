import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget buttonWithIcon(IconData icon, String text) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 7,
      ),
      color: textColor,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            text,
            style: const TextStyle(color: whiteColor),
          ),
        ],
      ),
    ),
  );
}
