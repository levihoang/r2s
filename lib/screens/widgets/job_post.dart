import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:it_intership_jobs_r2s/screens/widgets/hash_tag.dart';

import '../../utils/colors.dart';

class JobPost extends StatelessWidget {
  const JobPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('Click DetailPost');
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
                    log('Click Company');
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
                    log('Click Company');
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
      ),
    );
  }
}
