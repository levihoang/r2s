import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/screens/widgets/button_with_icon.dart';
import 'package:it_intership_jobs_r2s/screens/widgets/job_post.dart';
import 'package:it_intership_jobs_r2s/services/remote_service.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';

import '../../models/user.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  bool show = true;
  String username = '';
  String name = 'Công ty cổ phần R2S';
  String major = '';
  String cv = '';
  String phoneNumber = '';
  String email = '';
  String gender = '';
  String avatar = '';
  String tax = '12345678';
  User? user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    user = await RemoteService.getUser('2');
    if (user != null) {
      // name = user?.firstName ?? 'tên tài khoản';
      // username = user?.username ?? "Tên tài khoản";
      // cv = user?.cv ?? "";
      // major = user?.major ?? "C";
      // gender = user?.gender == 0 ? 'Nam' : 'Nữ';
      // email = user?.email ?? "";
      // phoneNumber = user?.phone ?? "";
      // avatar = user?.avatar ??
      //     'https://www.woolha.com/media/2020/03/flutter-circleavatar-radius.jpg';
      if (mounted) {
        setState(() {});
      }
    } else {
      log('Not Found user: $username');
    }
  }

  void showHide(bool b) {
    show = b;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CardVisit(
                        name: name,
                        avatar: avatar,
                        tax: tax,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 40, right: 20, left: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    showHide(true);
                                    setState(() {});
                                  },
                                  child:
                                      buttonWithIcon(Icons.list, 'Danh sách')),
                              InkWell(
                                  onTap: () {
                                    showHide(false);
                                    setState(() {});
                                  },
                                  child: buttonWithIcon(
                                      Icons.account_box, 'Giới thiệu')),
                            ]),
                      )
                    ],
                  ),
                  show == true
                      ? const JobsCompanyCard()
                      : const InformationCompanyCard(
                          description:
                              'Trở thành một trong những ngân hàng tốt nhất Việt Nam, hướng tới vị trí trong top 3, với định vị là một ngân hàng cộng đồng, có đội ngũ nhân viên thân thiện và điểm giao dịch thuận lợi',
                          email: 'abc@gmail.com',
                          phoneNumber: '0935638416',
                          website: 'https://r2s.com.vn/',
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                      color: whitePinkColor,
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.close_rounded,
                        color: textColor,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class JobsCompanyCard extends StatelessWidget {
  const JobsCompanyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          JobPost(
            isInCompany: true,
          ),
          SizedBox(
            height: 10,
          ),
          JobPost(
            isInCompany: true,
          ),
          SizedBox(
            height: 10,
          ),
          JobPost(
            isInCompany: true,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class InformationCompanyCard extends StatelessWidget {
  const InformationCompanyCard({
    super.key,
    required this.description,
    required this.website,
    required this.email,
    required this.phoneNumber,
  });

  final String description;
  final String website;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Text(
              'Giới thiệu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Website',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              'Link',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Số điện thoại',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 18),
            ),
          ]),
        ),
      ),
    );
  }
}

class CardVisit extends StatefulWidget {
  const CardVisit({
    super.key,
    required this.name,
    required this.avatar,
    required this.tax,
  });

  final String name;
  final String avatar;
  final String tax;

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
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                darkBlueColor,
                darkBlueColor,
                whiteBlueColor,
                whiteBlueColor,
                whiteBlueColor,
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
                        widget.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            fontSize: 30, color: yellowColor),
                      ),
                    ),
                    // Text(widget.name,
                    //     style: const TextStyle(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold,
                    //         color: whiteColor)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Mã số thuế: ${widget.tax}',
                      style: const TextStyle(color: whiteColor),
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
