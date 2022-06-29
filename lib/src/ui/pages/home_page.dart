import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/src/core/model/job.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../services/remote_service.dart';
import '../../utils/colors.dart';
import '../screens/loginandsignup_screen.dart';
import '../widgets/job_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // TopBar(),
        SizedBox(
          height: 10,
        ),
        SearchBar(),
        SizedBox(
          height: 10,
        ),
        Body(),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double sizeDivide = MediaQuery.of(context).size.width / 39;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            style: const TextStyle(fontSize: 15, color: textColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Tìm kiếm',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )),
          SizedBox(
            width: sizeDivide,
          ),
          InkWell(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginSignupScreen()),
              ),
            },
            child: Image.asset(
              'images/icon_filter.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class LatestPost extends StatelessWidget {
  const LatestPost({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageBriefController = PageController();

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 320,
          child: PageView(
            controller: pageBriefController,
            children: const [
              BriefPost(),
              BriefPost(),
              BriefPost(),
              BriefPost(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: pageBriefController,
          count: 4,
          effect: const WormEffect(
            activeDotColor: yellowColor,
            dotHeight: 5,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Posts()
      ],
    );
  }
}

// class MostPosts extends StatefulWidget {
//   const MostPosts({super.key});

//   @override
//   State<MostPosts> createState() => _MostPostsState();
// }

// class _MostPostsState extends State<MostPosts> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 10,
//         ),
//         Expanded(
//           child: ListView.builder(
//               itemCount: 2,
//               // scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 return const JobPost(isInCompany: true);
//               }),
//         ),
//       ],
//     );
//   }
// }

// class NearPosts extends StatelessWidget {
//   const NearPosts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 10,
//         ),
//         Expanded(
//           child: ListView.builder(
//               itemCount: 2,
//               // scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 return const JobPost(isInCompany: true);
//               }),
//         ),
//       ],
//     );
//   }
// }

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var bodyItems = [
    const LatestPost(),
    // const MostPosts(),
    // const NearPosts(),
  ];
  var topBar = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        topBar = 0;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Mới nhất',
                          style: TextStyle(
                              color: topBar == 0 ? yellowColor : Colors.black),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          topBar = 1;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Phổ biến nhất',
                            style: TextStyle(
                                color:
                                    topBar == 1 ? yellowColor : Colors.black),
                          ),
                        )),
                    InkWell(
                        onTap: () {
                          topBar = 2;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Gần nhất',
                            style: TextStyle(
                                color:
                                    topBar == 2 ? yellowColor : Colors.black),
                          ),
                        )),
                  ],
                ),
                bodyItems[topBar],
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BriefPost extends StatefulWidget {
  const BriefPost({super.key});

  @override
  State<BriefPost> createState() => _BriefPostState();
}

class _BriefPostState extends State<BriefPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/intro_1.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 70,
              color: Colors.white,
              child: const Text(
                'Nash Tech - Global software, offshore, development and IT company',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  Future<List<Job>?> getJobs() async {
    List<Job>? jobs = await RemoteService.getAllJobs();
    print(jobs?.map((e) => e.id));

    return jobs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>?>(
      future: getJobs(),
      builder: (context, jobsnapshot) {
        if (jobsnapshot.hasError) {
          return Container();
        } else if (jobsnapshot.hasData) {
          return SizedBox(
            width: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: jobsnapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return JobPost(
                    isInCompany: true,
                    job: jobsnapshot.data?[index],
                  );
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
