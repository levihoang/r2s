import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({Key? key}) : super(key: key);

  @override
  State<AlertDialogPage> createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 250),
      title: const Text("Add Member"),
      content: SizedBox(
        child: Row(
          children: [
            Column(
              children: const <Widget>[],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        ElevatedButton(
            onPressed: () async {},
            child: const Text(
              "Add",
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
