import 'package:flutter/material.dart';
import 'package:meditation/core/constants/app_constant.dart';
import 'package:meditation/core/widgets/my_wave_card.dart';
import 'package:meditation/core/widgets/card_music.dart';
import 'package:meditation/core/widgets/music_detail_page.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "All",
      "icon": const Icon(Icons.home, color: Colors.white),
    },
    {
      "title": "My",
      "icon": const Icon(Icons.heart_broken_sharp, color: Colors.white),
    },
    {
      "title": "Sleep",
      "icon": const Icon(Icons.bedtime, color: Colors.white),
    },
    {
      "title": "Kids",
      "icon": const Icon(Icons.child_care, color: Colors.white),
    },
    {
      "title": "Ambient",
      "icon": const Icon(Icons.music_note, color: Colors.white),
    },
  ];

  final List<Map<String,String>> myData = [
    {
      "title": "Daily Calm",
      "duration": "APR 30 . PAUSE PRACTICE",
      "image": "images/happy_morning.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Anxiety",
      "duration": "APR 30 . PAUSE PRACTICE",
      "image": "images/happy_morning.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Happiness",
      "duration": "APR 30 . PAUSE PRACTICE",
      "image": "images/happy_morning.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Focus",
      "duration": "APR 30 . PAUSE PRACTICE",
      "image": "images/happy_morning.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Sleep",
      "duration": "APR 30 . PAUSE PRACTICE",
      "image": "images/happy_morning.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Stress",
      "duration": "APR 30 . PAUSE PRACTICE",
      "image": "images/happy_morning.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstant.kBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Meditate",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Text(
                        "we can learn how to recognize when our minds",
                        textAlign: TextAlign.center, // Centre le texte
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "are doing their normal everyday acrobatics",
                        textAlign: TextAlign.center, // Centre le texte
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount:
                          items.length, // Utiliser la longueur de votre liste
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey.shade600,
                                ),
                                child: items[index]["icon"],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                items[index]["title"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyWaveCard(
                      title: "Daily Calm",
                      duration: "APR 30 . PAUSE PRACTICE",
                      onPressed: () {},
                      color: const Color(0xFFECD3C2),
                      textColor: Colors.black87,
                      iconColor: Colors.white,
                      image: const AssetImage("images/meditation_page.png")
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: myData.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return CardMusic(
                          textColor: Colors.black87,
                          title: myData[index]["title"] ?? "", // Utilisez l'opérateur ?? au lieu de !
                          duration: myData[index]["duration"] ?? "",
                          imageurl: myData[index]["image"] ?? "",
                          onTap: () {
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).push(
                                MaterialPageRoute(
                                    builder: (context) => MusicDetailPage(
                                      iconColor: Colors.red,
                                      title: myData[index]["title"] ?? "",
                                      duration: myData[index]["duration"] ?? "",
                                      imageurl: myData[index]["image"] ?? "",
                                      subtitleFirst: myData[index]["subtitleFirst"] ?? "",
                                      subtitleSecond: myData[index]["subtitleSecond"] ?? "",
                                      textColor: Colors.black87,
                                      backColor: AppConstant.kBackgroundColor,
                                    )
                                )
                            );
                          },
                        );
                      },
                    ),
                  )


                ],
              ),
            ),
          ),
        ));
  }
}
