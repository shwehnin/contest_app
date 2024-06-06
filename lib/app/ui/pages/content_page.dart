import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:contest_app/app/ui/pages/content_recent_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List list = [];
  List info = [];
  @override
  void initState() {
    super.initState();
    _readData();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/recent.json")
        .then((value) {
      setState(() {
        list = json.decode(value);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("assets/json/content_detail.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: const Color(0xFFc5e5f3),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/background.jpg"),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "James Smith",
                        style: TextStyle(
                            color: Color(0xFF3b3f42),
                            fontSize: 18,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Top Level",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFf3fafc)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Color(0xFF69c5df),
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    "Popular Contest",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Show all",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFfdc33c)),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 225,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.88),
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                        "/content_detail/",
                        arguments: {
                          "title": info[index]['title'],
                          "text": info[index]['text'],
                          "name": info[index]['name'],
                          "img": info[index]['img'],
                          "time": info[index]['time'],
                          "prize": info[index]['prize'],
                        },
                      ),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 20),
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: index.isEven
                              ? const Color(0xFF69c5df)
                              : const Color(0xFF9294cc),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    info[index]['title'],
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: width,
                              child: Text(
                                info[index]['text'],
                                style: const TextStyle(
                                    fontSize: 18, color: Color(0xFFb8eefc)),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1.0,
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 4; i++)
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage(info[i]['img']),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            //recent contests
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    "Recent Contests",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Show all",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFfdc33c)),
                    child: GestureDetector(
                      onTap: () => Get.to(() => const ContentRecentPage()),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => const ContentRecentPage()),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 20),
                        width: width,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFebf8fd),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(list[index]['img']),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    list[index]['status'],
                                    style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        decoration: TextDecoration.none),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      list[index]['text'],
                                      style: const TextStyle(
                                          color: Color(0xFF3b3f42),
                                          fontSize: 18,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Text(
                                  list[index]['time'],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    decoration: TextDecoration.none,
                                    color: Color(0xFFb2b8bb),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
