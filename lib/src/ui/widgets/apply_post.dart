import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/colors.dart';

import '../jobPage/detail_post_screen.dart';
import '../jobPage/profile_company_screen.dart';

class ApplyPost extends StatelessWidget {
  const ApplyPost({Key? key, required this.isInCompany}) : super(key: key);
  final bool isInCompany;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPost()),
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
                    isInCompany == false
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
                InkWell(
                  onTap: () {
                    isInCompany == false
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CompanyScreen()),
                          )
                        : null;
                  },
                  child: const SizedBox(
                    child: Text(
                      'Công ty cổ phần R2S',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
                    Icons.wifi_protected_setup_sharp,
                    // color: darkGrayColor,
                    color: Colors.blue,
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
                  children: const [],
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
      ),
    );
  }
}
