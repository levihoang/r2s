import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/src/core/model/job.dart';

import '../../utils/colors.dart';
import 'detail_post_screen.dart';
import 'profile_company_screen.dart';

class JobPost extends StatefulWidget {
  const JobPost({
    Key? key,
    this.job,
    this.isInCompany,
  }) : super(key: key);
  final Job? job;
  final bool? isInCompany;
  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPost(
                      job: widget.job,
                    )),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      widget.isInCompany == false
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CompanyScreen()),
                            )
                          : null;
                    },
                    child: const CircleAvatar(
                      radius: 27,
                      backgroundColor: darkGrayColor,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'images/logo_r2s.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 220,
                    child: InkWell(
                      onTap: () {
                        widget.isInCompany == false
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CompanyScreen()),
                              )
                            : null;
                      },
                      child: SizedBox(
                        child: Text(
                          widget.job?.name ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      log('Click Bookmark');
                    },
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
              Text(
                widget.job?.jobPosition?.name ?? "",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: darkGrayColor,
                  ),
                  Text(
                    widget.job?.locationJob?.address ?? 'Vị trí công việc',
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
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
                    children: const [],
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        ' ${widget.job?.salaryMin} - ${widget.job?.salaryMax}',
                        style: const TextStyle(
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
        ),
      ),
    );
  }
}
