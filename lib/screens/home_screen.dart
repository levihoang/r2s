import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayColor,
      body: SafeArea(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => {},
            child: Image.asset(
              'images/icon_line.png',
              height: 30,
              width: 30,
            ),
          ),
          const Text(
            'HOME',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Image.asset(
              'images/icon_notification.png',
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
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
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.close),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: ' Search',
              ),
            ),
          ),
          SizedBox(
            width: sizeDivide,
          ),
          Image.asset(
            'images/icon_filter.png',
            height: 20,
            width: 20,
            fit: BoxFit.cover,
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
    PageController pageHomeController = PageController();

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
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
        const Posts(),
      ],
    );
  }
}

class MostPosts extends StatelessWidget {
  const MostPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 20,
        ),
        Posts(),
      ],
    );
  }
}

class NearPosts extends StatelessWidget {
  const NearPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 20,
        ),
        Posts(),
      ],
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var bodyItems = [
    const LatestPost(),
    const MostPosts(),
    const NearPosts(),
  ];
  var topBar = 0;
  @override
  Widget build(BuildContext context) {
    PageController pageHomeController = PageController();

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      topBar = 0;
                      pageHomeController.jumpToPage(topBar);

                      setState(() {});
                    },
                    child: Text(
                      'Latest',
                      style: TextStyle(
                          color: topBar == 0 ? yellowColor : Colors.black),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        topBar = 1;
                        pageHomeController.jumpToPage(topBar);
                        setState(() {});
                      },
                      child: Text(
                        'Most',
                        style: TextStyle(
                            color: topBar == 1 ? yellowColor : Colors.black),
                      )),
                  InkWell(
                      onTap: () {
                        topBar = 2;
                        pageHomeController.jumpToPage(topBar);

                        setState(() {});
                      },
                      child: Text(
                        'Near',
                        style: TextStyle(
                            color: topBar == 2 ? yellowColor : Colors.black),
                      )),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 2000,
                    child: PageView(
                      controller: pageHomeController,
                      children: bodyItems,
                      onPageChanged: (value) {
                        topBar = value;
                        log('$pageHomeController');
                        setState(() {});
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BriefPost extends StatelessWidget {
  const BriefPost({super.key});

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

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PostCard(),
        SizedBox(
          height: 5,
        ),
        PostCard(),
        SizedBox(
          height: 5,
        ),
        PostCard(),
        SizedBox(
          height: 5,
        ),
        PostCard(),
        SizedBox(
          height: 5,
        ),
        PostCard(),
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 27,
                backgroundColor: darkGrayColor,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'images/logo_r2s.png',
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Công ty cổ phần R2S',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.bookmark,
                // color: darkGrayColor,
                color: yellowColor,
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

class HashTag extends StatelessWidget {
  const HashTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        color: grayColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Text(
          'Part - time',
        ),
      ),
    );
  }
}
