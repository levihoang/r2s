import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/src/ui/base/base_viewmodel.dart';
import 'package:it_intership_jobs_r2s/src/ui/personPage/unlogin_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/model/candidate.dart';
import '../../utils/colors.dart';
import '../widgets/button_with_icon.dart';
import 'edit_page.dart';
import 'setting_page.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  bool show = true;

  Candidate? candidate;

  @override
  void initState() {
    super.initState();
  }

  Controller personPageController = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return personPageController.isSigned() == true
        ? Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Trang cá nhân của tôi')),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.orange],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.5, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
            ),
            backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<Candidate?>(
                      future: personPageController.getCandidate(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          final error = snapshot.error;
                          return Text('$error');
                        } else if (snapshot.hasData) {
                          Candidate candidate = snapshot.data!;
                          return CardVisit(
                            username: "${candidate.userDTO?.username}",
                            name:
                                "${candidate.userDTO?.firstName} ${candidate.userDTO?.lastName}",
                            avatar: "${candidate.userDTO?.avatar}",
                          );
                        } else {
                          return const CardVisit(
                            name: '',
                            avatar: '',
                            username: '',
                          );
                        }
                      }),
                  FutureBuilder(
                      future: personPageController.getCandidate(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              InformationCard(
                                candidate: snapshot.data as Candidate,
                              ),
                            ],
                          );
                        } else {
                          return const InformationCard();
                        }
                      })),
                  settingButton(context),
                  logoutButton(context),
                ],
              ),
            ))
        : const UnLoginPage();
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
    this.candidate,
  });

  final Candidate? candidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Thông tin cá nhân",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditPage()),
                      )
                    },
                    child: const Text(
                      "Chỉnh sửa",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            customText(
                "Chuyên ngành", TablerIcons.briefcase, candidate?.major?.name),
            customText(
                "Giới tính",
                Icons.people_alt_rounded,
                candidate?.userDTO?.gender == 0
                    ? "Nam"
                    : candidate?.userDTO?.gender == 1
                        ? "Nữ"
                        : "Chưa xác định"),
            // customText(
            //     "Trạng thái",
            //     TablerIcons.clock,
            //     candidate?.userDTO?.status == "Active"
            //         ? "Đang hoạt động"
            //         : "Chưa hoạt động"),
            customText(
                "Email", Icons.email, candidate?.userDTO?.email ?? "Chưa có"),
            customText("Số điện thoại", TablerIcons.phone,
                candidate?.userDTO?.phone ?? "Chưa có"),
          ],
        ),
      ),
    );
  }
}

Widget customText(String text, IconData icon, String? data) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          data ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        )
      ],
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
      required this.username,
      required this.name,
      required this.avatar});

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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          // color: yellowColor,

          child: Wrap(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(alignment: Alignment.topCenter, children: const [
                      CircleAvatar(
                        backgroundColor: darkGrayColor,
                        radius: 75,
                        child: CircleAvatar(
                          // backgroundImage: (widget.avatar == '' ||
                          //             widget.avatar == "null"
                          //         ? const AssetImage('images/logo_r2s.jpg')
                          //         : CachedNetworkImageProvider(widget.avatar))
                          //     as ImageProvider,
                          backgroundImage: AssetImage('images/logo_r2s.jpg'),
                          radius: 70,
                        ),
                      ),
                    ]),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(fontSize: 30),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 20, left: 20, top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        'https://stackoverflow.com/questions/63625023/flutter-url-launcher-unhandled-exception-could-not-launch-youtube-url-caused-b'));
                                  },
                                  child: buttonWithIcon(
                                      Icons.account_box, 'CV của tôi')),
                            ]))
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

showAlertDialog(BuildContext context, Function function) {
  // Create button
  Widget okButton = TextButton(
    child: const Text(
      "Không",
      style: TextStyle(fontSize: 20),
    ),
    onPressed: () {
      function;
      Navigator.of(context).pop();
    },
  );
  Controller personPageController = Get.put(Controller());

  Widget cancelButton = TextButton(
    child:
        const Text("Đồng ý", style: TextStyle(fontSize: 20, color: Colors.red)),
    onPressed: () {
      Navigator.of(context).pop();
      personPageController.signOut();
      personPageController.changeSelectedIndex(0);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Đăng xuất",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    content: const Text("Bạn có muốn đăng xuất không?"),
    actions: [okButton, cancelButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget logoutButton(BuildContext context) {
  return InkWell(
    onTap: () {
      showAlertDialog(context, () => {});
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: const [
              Icon(
                TablerIcons.logout,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Đăng xuất',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget settingButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Setting()));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    TablerIcons.settings,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Cài đặt ứng dụng',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
