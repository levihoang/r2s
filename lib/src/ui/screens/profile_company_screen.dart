import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/model/company.dart';
import '../../core/model/locationDTO.dart';
import '../../core/model/user.dart';

import '../../services/remote_service.dart';
import '../../utils/colors.dart';
import '../widgets/button_with_icon.dart';
import '../widgets/job_post.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  bool show = true;
  Company? company;
  User? user;
  late Future<Company?> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getCompany();
  }

  Future<Company?> getCompany() async {
    company = await RemoteService.getCompany('1');
    return company;
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
                      FutureBuilder<Company?>(
                          future: dataFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              final error = snapshot.error;
                              return Text('$error');
                            } else if (snapshot.hasData) {
                              Company company = snapshot.data!;
                              return CardVisit(
                                  name: company.name ?? '',
                                  avatar: company.logo ?? '',
                                  tax: company.tax ?? '');
                            } else {
                              return const CardVisit(
                                  name: '', avatar: '', tax: '');
                            }
                          }),
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
                      : InformationCompanyCard(
                          description: company?.description,
                          email: company?.email,
                          phoneNumber: company?.phone,
                          website: company?.website,
                          location: company?.locationsDTO,
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
    this.location,
  });

  final String? description;
  final String? website;
  final String? email;
  final String? phoneNumber;
  final List<LocationsDTO>? location;

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
            customText(
              description ?? '',
            ),
            const Text(
              'Website',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            customText(website ?? ''),
            const Text(
              'Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            customText(email ?? ''),
            const Text(
              'Số điện thoại',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            customText(phoneNumber ?? ''),
            const Text(
              'Địa chỉ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: location?.length,
              itemBuilder: (BuildContext context, int index) {
                return customText(
                  'Số ${location?[index].note},đường ${location?[index].address}, quận ${location?[index].district?.name}, ${location?[index].district?.province?.shortName}',
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}

Widget customText(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 7, bottom: 7),
    child: Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
    ),
  );
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
                          backgroundImage: (widget.avatar.toString() == null
                                  ? const CachedNetworkImageProvider("")
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
