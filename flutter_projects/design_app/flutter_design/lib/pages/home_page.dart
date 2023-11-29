import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_design/pages/dersler_tile.dart';
import 'package:flutter_design/util/emotions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: ''),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Merhaba, Ömer!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "23 Jan 2023",
                            style: TextStyle(
                                color: Colors.blue[200],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Nasıl hissediyorsun?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          EmotionFace(emotionFace: '😄'),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Çok iyi",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          EmotionFace(emotionFace: '🙂'),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "İyi",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          EmotionFace(emotionFace: '😑'),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Hiç",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          EmotionFace(emotionFace: '😞'),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Kötü",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                child: Container(
                  color: Colors.grey.shade300,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Exercises",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Icon(Icons.more_horiz_outlined)
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: const [
                            DerslerTile(
                              icon: Icons.favorite,
                              dersAdi: "Etkili konuşma teknikleri",
                              dersNum: 16,
                              color: Colors.orange,
                            ),
                            DerslerTile(
                              icon: Icons.person_outlined,
                              dersAdi: "Hızlı okuma teknikleri",
                              dersNum: 8,
                              color: Colors.green,
                            ),
                            DerslerTile(
                              icon: Icons.star_outlined,
                              dersAdi: "Hızlı yazma teknikleri",
                              dersNum: 16,
                              color: Colors.purple,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
