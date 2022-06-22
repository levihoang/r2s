import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/pages/notification_screen.dart';

class NotificationTiles extends StatefulWidget {
  final String title, subtitle;
  final NotificationPage notificationPage;
  final bool enable;
  final String dayTime;
  const NotificationTiles({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.notificationPage,
    required this.enable,
    required this.dayTime,
  }) : super(key: key);

  @override
  State<NotificationTiles> createState() => _NotificationTilesState();
}

class _NotificationTilesState extends State<NotificationTiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          leading: Container(
              height: 50.0,
              width: 50.0,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/logo_company.png"),
                      fit: BoxFit.cover))),
          title: Text(
            widget.title,
            style: TextStyle(
                color: Colors.purple.shade900, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.subtitle,
              style: TextStyle(color: Colors.grey.shade600)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => widget.notificationPage));
          },
          enabled: widget.enable,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child:
              Text(widget.dayTime, style: const TextStyle(color: Colors.grey)),
        )
      ],
    );
  }
}
