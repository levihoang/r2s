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

class ApplyJobPost extends StatelessWidget {
  const ApplyJobPost({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundColor: darkGrayColor,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'images/logo_r2s.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Công ty cổ phần R2S',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.bookmark,
                  // color: darkGrayColor,
                  color: yellowColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Junior UI/UX Designer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on,
                color: darkGrayColor,
              ),
              Text(
                '1162 Pham Van Dong, Thu Duc',
                style: TextStyle(color: darkGrayColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  HashTag(),
                  SizedBox(
                    width: 5,
                  ),
                  HashTag(),
                ],
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text(
                    '\$4K',
                    style: TextStyle(
                        color: darkBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class CareJobPost extends StatelessWidget {
  const CareJobPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundColor: darkGrayColor,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'images/logo_r2s.png',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Công ty cổ phần R2S',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.bookmark,
                  // color: darkGrayColor,
                  color: yellowColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Junior UI/UX Designer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on,
                color: darkGrayColor,
              ),
              Text(
                '1162 Pham Van Dong, Thu Duc',
                style: TextStyle(color: darkGrayColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  HashTag(),
                  SizedBox(
                    width: 5,
                  ),
                  HashTag(),
                ],
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text(
                    '\$4K',
                    style: TextStyle(
                        color: darkBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
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
          child: Wrap(
            runSpacing: 10,
            children: const [
              ApplyJobPost(),
              ApplyJobPost(),
              ApplyJobPost(),
              ApplyJobPost(),
            ],
          ),
        ),
      ),
    );
  }
}

class CareJobs extends StatefulWidget {
  const CareJobs({super.key});

  @override
  State<CareJobs> createState() => _CareJobsState();
}

class _CareJobsState extends State<CareJobs> {
  var listJob = <CareJobPost>[
    const CareJobPost(),
    const CareJobPost(),
    const CareJobPost(),
    const CareJobPost(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            runSpacing: 10,
            children: listJob,
          ),
        ),
      ),
    );
  }
}
