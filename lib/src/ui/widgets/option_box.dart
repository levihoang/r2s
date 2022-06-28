import 'package:flutter/material.dart';

import '../pages/notification_screen.dart';

class OptionBox extends StatefulWidget {
  final String title;
  final NotificationPage? notificationPage;
  final bool enable;

  const OptionBox({
    Key? key,
    required this.title,
    this.notificationPage,
    required this.enable,
  }) : super(key: key);

  @override
  State<OptionBox> createState() => _OptionBox();
}

class _OptionBox extends State<OptionBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black87, fontSize: 20),
          ),
          enabled: widget.enable,
        ),
      ],
    );
  }
}
