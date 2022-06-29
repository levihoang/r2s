import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_intership_jobs_r2s/src/core/remote/api_service.dart';

import '../../core/model/job.dart';
import '../../utils/colors.dart';
import '../widgets/apply_post.dart';
import '../widgets/hash_tag.dart';
import '../widgets/job_post.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  var selectedIndex = 0;
  late Future<List<Job>?> dataFuture;
  var jobs;

  Future<List<Job>?> getAllJob() async {
    jobs = await ApiService(Dio()).getJobs();
    return jobs;
  }

  @override
  void initState() {
    super.initState();
    dataFuture = getAllJob();
  }

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
                      child: Text('Đang quan tâm',
                          style: GoogleFonts.openSans(
                            fontWeight: selectedIndex == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: whiteColor,
                          ))),
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
                    child: Text('Đang ứng tuyển',
                        style: GoogleFonts.openSans(
                          fontWeight: selectedIndex == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: whiteColor,
                        )),
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

Widget aspplyJobLists() {
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
              ApplyPost(
                isInCompany: false,
              ),
              ApplyPost(
                isInCompany: false,
              ),
              ApplyPost(
                isInCompany: false,
              ),
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
  var listJob = <JobPost>[
    // const JobPost(
    //   isInCompany: false,
    // ),
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
