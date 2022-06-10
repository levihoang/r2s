import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';
import 'package:it_intership_jobs_r2s/utils/dimensions.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  bool show = true;
  final String username = '@hoangtrungnhat';
  final String name = 'Hoàng Trung Nhật';
  final String major = 'Flutter Developer';
  final String cv =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form accompanied by English versions from the 1914 translation by H. Rackham ";

  final String phoneNumber = '+84935648416';
  final String email = 'abc@gmail.com';
  final String gender = 'Nam';

  @override
  Widget build(BuildContext context) {
    log('$show');
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CardVisit(
                major: major,
                username: username,
                name: name,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            _update(true);
                          },
                          child: buttonWithIcon(Icons.account_box, 'CV')),
                      InkWell(
                          onTap: () {
                            _update(false);
                          },
                          child: buttonWithIcon(Icons.link, 'Chi tiết')),
                    ]),
              )
            ],
          ),
          show == true
              ? CVCard(cv: cv)
              : InformationCard(
                  phoneNumber: phoneNumber,
                  gender: gender,
                  email: email,
                ),
        ],
      ),
    );
  }

  void _update(bool b) {
    show = b;
    setState(() {});
  }
}

class CVCard extends StatelessWidget {
  const CVCard({
    Key? key,
    required this.cv,
  }) : super(key: key);

  final String cv;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          color: whiteColor,
          child: Text(cv),
        ),
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    super.key,
    required this.gender,
    required this.email,
    required this.phoneNumber,
  });

  final String gender;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Giới tính',
            style:
                GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: whiteColor,
              child: Text(
                gender,
                style: const TextStyle(fontSize: mText),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Địa chỉ Email',
            style:
                GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: whiteColor,
              width: double.infinity,
              child: Text(
                email,
                style: const TextStyle(fontSize: mText),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Số điện thoại',
            style:
                GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: whiteColor,
              width: double.infinity,
              child: Text(
                phoneNumber,
                style: const TextStyle(fontSize: mText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class ButtonShow extends StatelessWidget {
  const ButtonShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 7,
              ),
              color: textColor,
              child: Row(
                children: const [
                  Icon(
                    Icons.account_box,
                    color: Colors.white,
                  ),
                  Text(
                    'CV',
                    style: TextStyle(color: whiteColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 7,
              ),
              color: textColor,
              child: Row(
                children: const [
                  Icon(
                    Icons.link,
                    color: whiteColor,
                  ),
                  Text(
                    'Chi tiết',
                    style: TextStyle(color: whiteColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardVisit extends StatefulWidget {
  const CardVisit(
      {super.key,
      required this.major,
      required this.username,
      required this.name});

  final String major;
  final String username;
  final String name;

  @override
  State<CardVisit> createState() => _CardVisitState();
}

class _CardVisitState extends State<CardVisit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          // color: yellowColor,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                yellowColor,
                yellowColor,
                yellowColor,
                whitePinkColor,
                whitePinkColor,
              ])),
          child: Wrap(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(alignment: Alignment.topCenter, children: [
                      const CircleAvatar(
                        backgroundColor: darkGrayColor,
                        radius: 75,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'images/sontung.png',
                          ),
                          radius: 70,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            log('Setting');
                          },
                          child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(Icons.edit)),
                        ),
                      ),
                    ]),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.username,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(fontSize: 30),
                      ),
                    ),
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.major,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
