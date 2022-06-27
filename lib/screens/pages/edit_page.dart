import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/models/candidate.dart';
import 'package:it_intership_jobs_r2s/models/major.dart';

import '../../services/remote_service.dart';
import '../widgets/app_bar.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key, this.candidate}) : super(key: key);
  final Candidate? candidate;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late List<Major>? major;

  late Future<List<Major>?> dataFututreMajor;
  @override
  void initState() {
    super.initState();
    dataFututreMajor = getAllMajor();
  }

  Future<List<Major>?> getAllMajor() async {
    major = await RemoteService.getAllMajor();
    return major;
  }

  final List<String> genderItems = [
    'Nam',
    'Nữ',
  ];

  String? selectedValue;
  TextEditingController? email;
  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarR2s(
        iconData: Icons.save,
        iconCLick: () => {},
        title: "Giới thiệu về bạn",
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputBox("Họ", lastName, false, context,
                  widget.candidate?.userDTO?.lastName),
              inputBox("Tên", firstName, false, context,
                  widget.candidate?.userDTO?.firstName),
              const SizedBox(height: 20),
              dropBox(
                  "Giới tính",
                  widget.candidate?.userDTO?.gender == 0
                      ? "Nam"
                      : widget.candidate?.userDTO?.gender == 1
                          ? "Nữ"
                          : "Chưa xác định",
                  genderItems,
                  selectedValue),
              const SizedBox(height: 20),
              inputBox("Email", email, false, context,
                  widget.candidate?.userDTO?.email),
              inputBox("Số điện thoại", phone, false, context,
                  widget.candidate?.userDTO?.phone),
              FutureBuilder<List<Major>?>(
                  future: dataFututreMajor,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      final error = snapshot.error;
                      return Text('$error');
                    } else if (snapshot.hasData) {
                      List<Major> majors = snapshot.data!;
                      List<String?> listMajors = <String>[];
                      for (var element in majors) {
                        {
                          listMajors.add(element.name);
                        }
                      }
                      return dropBox(
                          "Chuyên ngành",
                          widget.candidate?.major?.name,
                          listMajors,
                          selectedValue);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputBox(String text, TextEditingController? controller,
    bool obscureText, BuildContext context, String? hintText) {
  return SizedBox(
    height: 90,
    child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: text,
          hintText: hintText,
          labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 1, color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(width: 1, color: Colors.grey)),
        )),
  );
}

Widget dropBox(String title, String? initValue, List<String?> genderItems,
    String? selectedValue) {
  return DropdownButtonFormField2(
    decoration: InputDecoration(
      prefixIcon: const Icon(
        Icons.people,
        color: Colors.black,
      ),
      labelText: title,
      labelStyle: const TextStyle(
          fontSize: 20, color: Colors.black, letterSpacing: 1.5),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1, color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1, color: Colors.grey)),
    ),
    isExpanded: true,
    hint: Text(
      initValue ?? "",
      style: const TextStyle(fontSize: 16),
    ),
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black45,
    ),
    iconSize: 30,
    buttonHeight: 30,
    dropdownDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    items: genderItems
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item ?? "",
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Please select gender.';
      }
      return null;
    },
    onChanged: (value) {
      //Do something when changing the item if you want.
    },
    onSaved: (value) {
      selectedValue = value.toString();
    },
  );
}
