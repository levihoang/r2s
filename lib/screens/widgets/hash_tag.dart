import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HashTag extends StatelessWidget {
  const HashTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('Click hashtag');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          color: grayColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Text(
            'Part - time',
          ),
        ),
      ),
    );
  }
}
