import 'package:flutter/material.dart';

class Fillter extends StatefulWidget {
  const Fillter({Key? key}) : super(key: key);

  @override
  State<Fillter> createState() => _FillterState();
}

class _FillterState extends State<Fillter> {
  String? selectedValue;
  String tasktype = "";

  final _dropdownFormKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USA", child: Text("USA")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    double sizediv = MediaQuery.of(context).size.width / 39;
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          title: const Text(
            'Fillter',
            style: TextStyle(color: Colors.black, letterSpacing: 1),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(sizediv),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title("Ngành Nghề"),
              SizedBox(
                height: sizediv,
              ),
              dropDownPositon(),
              SizedBox(
                height: sizediv,
              ),
              title("Địa Điểm"),
              title("Mức Lương"),
              title("Hình thức làm việc"),
              Row(
                children: [
                  taskSelect("Full-time", 0xFFE0E0E0, sizediv),
                  taskSelect("Part time", 0xFFE0E0E0, sizediv),
                  taskSelect("Remote", 0xFFE0E0E0, sizediv)
                ],
              )
            ],
          ),
        ));
  }

  Widget title(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.grey[400],
          fontSize: 17,
          letterSpacing: 0.5,
          wordSpacing: 2,
          fontWeight: FontWeight.bold),
    );
  }

  Widget taskSelect(String lable, int color, double size) {
    return Padding(
      padding: EdgeInsets.only(left: size),
      child: InkWell(
        onTap: () {
          setState(() {
            tasktype = lable;
          });
        },
        child: Chip(
          backgroundColor: tasktype == lable
              ? Color.fromARGB(255, 240, 173, 66)
              : Color(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            lable,
            style: const TextStyle(
              color: Color.fromARGB(255, 15, 14, 14),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          labelPadding:
              const EdgeInsets.symmetric(horizontal: 17, vertical: 3.8),
        ),
      ),
    );
  }

  Widget dropDownPositon() {
    return Form(
        key: _dropdownFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 243, 240, 238), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 242, 240, 239), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(72, 234, 236, 238), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 232, 235, 240),
                ),
                validator: (value) => value == null ? "Select a country" : null,
                dropdownColor: Color.fromARGB(255, 229, 229, 239),
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: dropdownItems),
          ],
        ));
  }
}
