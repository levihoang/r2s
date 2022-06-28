import 'package:flutter/material.dart';

class NavigatorBox extends StatefulWidget {
  const NavigatorBox({
    Key? key,
    this.function,
    required this.title,
  }) : super(key: key);
  final dynamic function;
  final String title;

  @override
  State<NavigatorBox> createState() => _NavigatorBoxState();
}

class _NavigatorBoxState extends State<NavigatorBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.function));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    size: 20,
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
