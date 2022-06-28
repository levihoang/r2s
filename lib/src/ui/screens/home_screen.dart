import 'dart:developer';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/global_variables.dart';
import '../widgets/job_post.dart';

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
        child: appScreen[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Công việc'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Thông báo'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cá nhân'),
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
            'Home',
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

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sizeDivide = MediaQuery.of(context).size.width / 39;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
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
              onChanged: (value) => {
                log(_searchController.text),
              },
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

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Latest',
                    style: TextStyle(
                      color: yellowColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Most'),
                  Text('Near'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const BriefPost(),
              const SizedBox(
                height: 20,
              ),
              const PostLatest(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: Image.asset(
            'images/intro_1.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(10),
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
    );
  }
}

class PostLatest extends StatelessWidget {
  const PostLatest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        JobPost(
          isInCompany: false,
        ),
        SizedBox(
          height: 5,
        ),
        JobPost(
          isInCompany: false,
        ),
        SizedBox(
          height: 5,
        ),
        JobPost(
          isInCompany: false,
        ),
        SizedBox(
          height: 5,
        ),
        JobPost(
          isInCompany: false,
        ),
        SizedBox(
          height: 5,
        ),
        JobPost(
          isInCompany: false,
        ),
      ],
    );
  }
}
