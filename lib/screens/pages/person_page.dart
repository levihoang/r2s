import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/models/candidate.dart';
import 'package:it_intership_jobs_r2s/services/remote_service.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';
import 'package:it_intership_jobs_r2s/utils/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/user.dart';
import '../widgets/button_with_icon.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  bool show = true;
  String username = '123455663';
  String name = '';
  String major = '';
  String cv = '';
  String phoneNumber = '';
  String email = '';
  String gender = '';
  String avatar = '';
  User? user;
  Candidate? candidate;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    candidate = await RemoteService.getCandidate('liemha3');

    if (candidate != null) {
      name = candidate?.userDTO?.firstName ?? 'asd';
      username = candidate?.userDTO?.username ?? "";
      gender = candidate?.userDTO?.gender == 0 ? 'Nam' : 'Nữ';
      email = candidate?.userDTO?.email ?? "";
      phoneNumber = candidate?.userDTO?.phone ?? "";
      avatar = candidate?.userDTO?.avatar ?? '';
      major = candidate?.major?.name ?? "";
      cv = candidate?.cv ?? "";

      if (mounted) {
        setState(() {});
      }
    } else {
      log('Not Found user: $username');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                avatar: avatar,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(
                                'https://stackoverflow.com/questions/63625023/flutter-url-launcher-unhandled-exception-could-not-launch-youtube-url-caused-b'));
                          },
                          child: buttonWithIcon(Icons.account_box, 'CV')),
                    ]),
              )
            ],
          ),
          InformationCard(
            phoneNumber: phoneNumber,
            gender: gender,
            email: email,
          ),
        ],
      ),
    );
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
          child: Center(
              child: cv == ''
                  ? const Text(
                      'Chưa có bản lí lịch',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  : Text(
                      cv,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    )),
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
            'Email',
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
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
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
      required this.name,
      required this.avatar});

  final String major;
  final String username;
  final String name;
  final String avatar;

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
                      CircleAvatar(
                        backgroundColor: darkGrayColor,
                        radius: 75,
                        child: CircleAvatar(
                          backgroundImage: (widget.avatar != ''
                                  ? CachedNetworkImageProvider(widget.avatar)
                                  : const AssetImage('images/logo_r2s.jpg'))
                              as ImageProvider,
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
