import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Fillter extends StatefulWidget {
  const Fillter({Key? key}) : super(key: key);

  @override
  State<Fillter> createState() => _FillterState();
}

class _FillterState extends State<Fillter> {
  num? start, end;
  String? selectedValue;
  String tasktype = "";
  bool circular = false;
  final double _currentSliderValue = 20;
  SfRangeValues _values = const SfRangeValues(0, 10);

  final _dropdownFormKey = GlobalKey<FormState>();
  // List<DropdownMenuItem<String>> get dropdownItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     const DropdownMenuItem(value: "USA", child: Text("USA")),
  //     const DropdownMenuItem(value: "Canada", child: Text("Canada")),
  //     const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
  //     const DropdownMenuItem(value: "England", child: Text("England")),
  //   ];
  //   return menuItems;
  // }
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

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
                height: sizediv * 2,
              ),
              dropDownPositon(items, "Chọn ngành nghề"),
              SizedBox(
                height: sizediv * 2,
              ),
              title("Địa Điểm"),
              SizedBox(
                height: sizediv * 2,
              ),
              dropDownPositon(items, "Chọn địa điểm"),
              SizedBox(
                height: sizediv * 2,
              ),
              title("Mức Lương"),
              SizedBox(
                height: sizediv * 2,
              ),
              salaryRange(),
              SizedBox(
                height: sizediv * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Từ ${_values.start.toString().replaceFirst(".0", "")}-${_values.end.toString().replaceFirst(".0", "")} triệu",
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: sizediv * 2,
              ),
              title("Hình thức làm việc"),
              SizedBox(
                height: sizediv * 2,
              ),
              Row(
                children: [
                  taskSelect("Full-time", 0xFFE0E0E0, sizediv),
                  taskSelect("Part time", 0xFFE0E0E0, sizediv),
                  taskSelect("Remote", 0xFFE0E0E0, sizediv)
                ],
              ),
              SizedBox(
                height: sizediv * 3,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [button("Áp Dụng", sizediv)],
                ),
              )
            ],
          ),
        ));
  }

  Widget button(String btnname, double sizediv) {
    return InkWell(
      onTap: () async {
        setState(() {
          // circular = true;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: sizediv * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellowAccent),
        child: Center(
          child: circular
              ? const CircularProgressIndicator()
              : Text(
                  btnname,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
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
              ? const Color.fromARGB(255, 186, 174, 154)
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

  Widget salaryRange() {
    return SfRangeSlider(
      min: 0,
      max: 10,
      values: _values,
      interval: 2,
      showTicks: true,
      showLabels: true,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey[300],
      enableTooltip: true,
      minorTicksPerInterval: 1,
      stepSize: 1,
      onChanged: (SfRangeValues values) {
        setState(() {
          _values = values;
        });
      },
    );
  }

  Widget dropDownPositon(List<String> list, String text) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 29, 29, 28),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: list
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 21, 20, 20),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 14,
          iconEnabledColor: const Color.fromARGB(255, 16, 16, 15),
          iconDisabledColor: Colors.white,
          buttonHeight: 50,
          buttonWidth: MediaQuery.of(context).size.width - 30,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color.fromARGB(66, 241, 234, 234),
            ),
            color: Colors.white,
          ),
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: MediaQuery.of(context).size.width - 30,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(0, 0),
        ),
      ),
    );
  }
}
