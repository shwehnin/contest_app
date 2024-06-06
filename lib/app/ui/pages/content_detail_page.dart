import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:contest_app/app/ui/pages/content_page.dart';
import 'package:contest_app/app/controller/fav_controller.dart';

class ContentDetailPage extends StatefulWidget {
  const ContentDetailPage({super.key});

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  FavController fav = Get.put(FavController());
  FavController favController = Get.find<FavController>();
  List imgs = [];
  @override
  void initState() {
    super.initState();
    _readData();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/image.json")
        .then((value) {
      setState(() {
        imgs = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: const Color(0xFFc5e5f3),
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 50,
              left: 10,
              child: IconButton(
                onPressed: () => Get.to(
                  () => const ContentPage(),
                ),
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              height: 100,
              width: width,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          Get.arguments['img'],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Get.arguments['name'],
                            style: const TextStyle(
                                color: Color(0xFF3b3f42),
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Top Level",
                            style: TextStyle(
                                color: Color(0xFFfdebb2),
                                fontSize: 12,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: 70,
                        height: 120,
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
              ),
            ),
            Positioned(
              top: 320,
              left: 0,
              width: width,
              height: height,
              child: Container(
                width: 80,
                height: 80,
                color: const Color(0xFFf9fbfc),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              width: width,
              height: 260,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFfcfffe),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 10),
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Get.arguments['title'],
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: width,
                        child: Text(
                          Get.arguments['text'],
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFFb8b8b8)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        thickness: 1.0,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.watch_later,
                                color: Color(0xFF69c5df),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments["name"],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    "Deadline",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.monetization_on,
                                  color: Color(0xFFfb8483)),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Get.arguments["prize"],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Text(
                                    "Prize",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Color(0xFFfbc33e)),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Top Level",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFacacac)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 540,
              left: 25,
              height: 50,
              child: Container(
                child: RichText(
                  text: const TextSpan(
                    text: "Total Participants",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: " (11)",
                        style: TextStyle(
                          color: Color(0xFFfbc33e),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                for (int i = 0; i < imgs.length; i++)
                  Positioned(
                    top: 590,
                    width: 50,
                    height: 50,
                    left: (20 + i * 35),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(imgs[i]['img']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
              ],
            ),
            Positioned(
              top: 670,
              left: 25,
              child: Row(
                children: [
                  Obx(
                    () => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFfbc33e),
                      ),
                      child: IconButton(
                          onPressed: () => fav.favCounter(),
                          icon: favController.fav.value != 1
                              ? const Icon(Icons.favorite_border)
                              : const Icon(Icons.favorite),
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Add to favorite",
                    style: TextStyle(color: Color(0xFFfbc33e), fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
