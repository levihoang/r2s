import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/utils/colors.dart';

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
            TopBar(),
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

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            width: 10,
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
