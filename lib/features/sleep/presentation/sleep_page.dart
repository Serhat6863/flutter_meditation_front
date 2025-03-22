import 'package:flutter/material.dart';
import 'package:meditation/core/constants/app_constant.dart';
import 'package:meditation/core/widgets/music_detail_page.dart';
import 'package:meditation/features/sleep/widget/music_player.dart';

import '../../../core/widgets/card_music.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  final List<Map<String, String>> categories = [
    {'icon': 'images/diamond.png', 'label': 'All'},
    {'icon': 'images/diamond.png', 'label': 'Popular'},
    {'icon': 'images/diamond.png', 'label': 'New'},
    {'icon': 'images/diamond.png', 'label': 'Sleep'},
    {'icon': 'images/diamond.png', 'label': 'Meditate'},
    {'icon': 'images/diamond.png', 'label': 'Music'},
  ];

  final musciItems = [
    {
      "title": "Night Island",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/night_island.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Sweet Sleep",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/owls.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Good Night",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/night_island.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Moon Clouds",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/owls.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Night Island",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/night_island.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Sweet Sleep",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/owls.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Good Night",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/night_island.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    },
    {
      "title": "Moon Clouds",
      "duration": "45 MIN . SLEEP MUSIC",
      "imageurl": "images/owls.png",
      "subtitleFirst": "Ease the mind into a restful night’s sleep with",
      "subtitleSecond": "these deep, ambient tones.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.kBackgroundSleepColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image en arrière-plan
                  Image.asset(
                    'images/sleep_back.png',
                    fit: BoxFit.cover,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sleep Stories",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Soothing bedtime stories to help you fall",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "into a deep and natural sleep",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Reste du contenu
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF8E97FD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              category['icon']!,
                              fit: BoxFit.cover,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category['label']!,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity, // Occupe toute la largeur possible
                height: 250, // Hauteur définie
                child: Stack(
                  children: [
                    // Image de fond
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Applique le radius à l'image
                      child: Image.asset(
                        'images/ocean_moon.png',
                        fit:
                            BoxFit.cover, // Remplit toute la zone sans déformer
                      ),
                    ),

                    // Contenu centré
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Centre verticalement
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Centre horizontalement
                        children: [
                          const Text(
                            "The Ocean Moon",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFFFE7BF),
                            ),
                          ),
                          const SizedBox(
                              height: 10), // Espacement entre les textes
                          Text(
                            "Non-Stop 8 hour mixes of our",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          Text(
                            "most popular sleep audio",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          // Bouton "Start"
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MusicPlayerPage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Liste des histoires
              Padding(
               padding: EdgeInsets.all(8.0),
               child: GridView.builder(
                 physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: musciItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                 itemBuilder: (context, index){
                   return CardMusic(
                      title: musciItems[index]['title']!,
                      duration: musciItems[index]['duration']!,
                      imageurl: musciItems[index]['imageurl']!,
                      textColor: Colors.white,
                      onTap: () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).push(
                          MaterialPageRoute(
                            builder: (context) => MusicDetailPage(
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              backColor: AppConstant.kBackgroundSleepColor,
                              title: musciItems[index]['title']!,
                              duration: musciItems[index]['duration']!,
                              imageurl: musciItems[index]['imageurl']!,
                              subtitleFirst: musciItems[index]['subtitleFirst']!,
                              subtitleSecond: musciItems[index]['subtitleSecond']!,
                            ),
                          ),
                        );
                      },
                   );
                 },
               ),
             )
          ],
        ),
      ),
    );
  }
}
