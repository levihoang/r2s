import 'package:flutter/material.dart';

class DetailPost extends StatefulWidget {
  const DetailPost({Key? key}) : super(key: key);

  @override
  State<DetailPost> createState() => _DetailPostState();
}

bool isChangeColor = false;

class _DetailPostState extends State<DetailPost> {
  @override
  Widget build(BuildContext context) {
    double sizediv = MediaQuery.of(context).size.width / 39;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.bookmark_add_sharp,
                color: isChangeColor ? Colors.brown : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isChangeColor = !isChangeColor;
                });
              },
            )
          ],
          title: const Text("Chi tiết công việc",
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black87, //change your color here
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Full Stack Ruby on Rails Devoloper",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: sizediv,
                ),
                Text(
                  "Đăng ngày October 24, 2016",
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: sizediv,
                ),
                Text(
                  "Cập nhật lần cuối October 24, 2016, 13pm",
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: sizediv,
                ),
                companyInfor(context),
                SizedBox(
                  height: sizediv,
                ),
                SJP(),
                SizedBox(
                  height: sizediv,
                ),
                Divider(
                  color: Colors.grey.shade400,
                ),
                title("Miêu tả công việc", 17, Colors.black),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("Yêu cầu ứng viên", 17, Colors.black),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
                title("  Thành thạo ngôn ngữ lập trình ReactJS.", 15,
                    Colors.grey),
              ],
            ),
          ),
        ),
        bottomNavigationBar: button("Ứng tuyển ngay", sizediv, context),
      ),
    );
  }
}

Widget SJP() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset(
              "images/money1.png",
              width: 55,
              height: 55,
            ),
            title("Mức Lương", 15, Colors.black),
            title("3-5 triệu", 13, Colors.grey)
          ],
        ),
        Column(
          children: [
            Image.asset(
              "images/time2.png",
              width: 55,
              height: 55,
            ),
            title("Hình thức làm việc", 15, Colors.black),
            title("Fulltime", 13, Colors.grey)
          ],
        ),
        Column(
          children: [
            Image.asset(
              "images/chair1.png",
              width: 55,
              height: 55,
            ),
            title("Vị trí", 15, Colors.black),
            title("Thực tập sinh", 13, Colors.grey)
          ],
        )
      ],
    ),
  );
}

Widget companyInfor(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "images/google.jpg",
                        height: 30,
                        width: 30,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title("CÔNG TY", 18, Colors.black),
                        const Text("Rockstart Games INC"),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title("VỊ TRÍ", 18, Colors.black),
            const Text("New York, United States"),
          ],
        )
      ],
    ),
  );
}

// Widget titleBox(double size, BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 10),
//     child: Container(
//       height: size * 10,
//       width: MediaQuery.of(context).size.width - 30,
//       color: Colors.grey.shade200,
//       child: Column(
//         children: [
//           title("UI/UX Design", size * 2),
//         ],
//       ),
//     ),
//   );
// }

Widget title(String text, double size, Color color) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: color),
  );
}

Widget button(String btnname, double sizediv, BuildContext context) {
  return InkWell(
    onTap: () async {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: sizediv * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orangeAccent),
        child: Center(
          child: Text(
            btnname,
            style: const TextStyle(fontSize: 19, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
