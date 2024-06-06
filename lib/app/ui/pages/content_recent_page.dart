import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ContentRecentPage extends StatefulWidget {
  const ContentRecentPage({super.key});

  @override
  State<ContentRecentPage> createState() => _ContentRecentPageState();
}

class _ContentRecentPageState extends State<ContentRecentPage> {
  List recent = [];
  @override
  void initState() {
    _readData();
    super.initState();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/content_detail.json")
        .then((value) {
      setState(() {
        recent = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF69c5df),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFcbe6f6),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < recent.length; i++)
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 240,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(
                          "/content_detail/",
                          arguments: {
                            "title": recent[i]['title'],
                            "text": recent[i]['text'],
                            "name": recent[i]['name'],
                            "img": recent[i]['img'],
                            "time": recent[i]['time'],
                            "prize": recent[i]['prize'],
                          },
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20),
                          height: 220,
                          width: MediaQuery.of(context).size.width - 20,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: i.isEven
                                ? const Color(0xFF69c5df)
                                : const Color(0xFF9294cc),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      recent[i]['title'],
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
                                  recent[i]['text'],
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
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(recent[i]['img']),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
