import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/screens/home_screen.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  var selectedIndex = 0;

  var bodyItems = [
    const CareJobs(),
    const ApplyJobs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  selectedIndex = 0;
                  setState(() {});
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                      color: selectedIndex == 0 ? yellowColor : darkBlueColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text('Đang theo dõi',
                          style: GoogleFonts.openSans(color: whiteColor))),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  selectedIndex = 1;
                  setState(() {});
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: selectedIndex == 1 ? yellowColor : darkBlueColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text('Đã đăng ký',
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold, color: whiteColor)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        bodyItems[selectedIndex],
        // const ApplyJobs(),
      ],
    );
  }
}

class ApplyJobs extends StatelessWidget {
  const ApplyJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CareJobs extends StatelessWidget {
  const CareJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
              SizedBox(
                height: 10,
              ),
              PostCard(),
            ],
          ),
        ),
      ),
    );
  }
}
