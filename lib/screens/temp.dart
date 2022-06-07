// import 'package:flutter/material.dart';
// import 'package:it_intership_jobs_r2s/utils/colors.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: SafeArea(
//         child: Center(
//             child: Column(
//           children: const [
//             TopBar(),
//             Body(),
//           ],
//         )),
//       ),
//     );
//   }
// }

// class TopBar extends StatelessWidget {
//   const TopBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 10,
//         vertical: 10,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             onTap: () => {},
//             child: Image.asset(
//               'images/icon_line.png',
//               height: 30,
//               width: 30,
//             ),
//           ),
//           const Text(
//             'Home',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           InkWell(
//             onTap: () => {},
//             child: Image.asset(
//               'images/icon_notification.png',
//               height: 30,
//               width: 30,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//       child: Column(
//         children: [
//           const TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Color(0xFFFFFFFF),
//               prefixIcon: Icon(Icons.search, color: Colors.grey),
//               suffixIcon: Icon(Icons.close),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//               ),
//               hintText: ' Search',
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: const [
//               Text(
//                 'Latest',
//                 style: TextStyle(
//                   color: yellowColor,
//                 ),
//               ),
//               Text('Most'),
//               Text('Near'),
//             ],
//           ),
//           const BriefPost(),
//           const PostLatest(),
//         ],
//       ),
//     );
//   }
// }

// class BriefPost extends StatelessWidget {
//   const BriefPost({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(20), topLeft: Radius.circular(20)),
//           child: Image.asset(
//             'images/intro_1.jpg',
//             height: 250,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const Text(
//           'Nash Tech - Global software, offshore, development and IT company',
//           style: TextStyle(fontSize: 20),
//         ),
//         const Text(
//           'HCM',
//           style: TextStyle(color: yellowColor),
//         )
//       ],
//     );
//   }
// }

// class PostLatest extends StatelessWidget {
//   const PostLatest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(children: const [PostCard()]),
//     );
//   }
// }

// class PostCard extends StatelessWidget {
//   const PostCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(children: [
//         ClipRRect(
//           borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
//           child: Image.asset(
//             'images/mbbank.png',
//             width: MediaQuery.of(context).size.width * 0.3,
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             height: MediaQuery.of(context).size.width * 0.3,
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'MBBank',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '\nMobile Developer\n(Flutter)',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
