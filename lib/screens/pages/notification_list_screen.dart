import 'package:flutter/material.dart';

import 'notification_screen.dart';
import '../widgets/notification_title.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Thông báo", style: TextStyle(color: Colors.indigo)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'E-Commerce',
              subtitle: 'Thanks for download E-Commerce app.',
              enable: true,
              notificationPage: NotificationPage(),
              dayTime: '17/03/2022 13:20',
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          }),
    );
  }
}
