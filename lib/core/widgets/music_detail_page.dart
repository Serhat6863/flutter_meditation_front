import 'package:flutter/material.dart';
import 'package:meditation/core/constants/app_constant.dart';

import 'card_music.dart';

class MusicDetailPage extends StatelessWidget {
  const MusicDetailPage({super.key, required this.imageurl, required this.title, required this.duration, required this.subtitleFirst, required this.subtitleSecond, required this.textColor, required this.backColor, required this.iconColor});

  final String imageurl;
  final String title;
  final String duration;
  final String subtitleFirst;
  final String subtitleSecond;
  final Color textColor;
  final Color backColor;
  final Color iconColor;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(
                  imageurl,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 40,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    icon:  const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero, //
                    constraints: const BoxConstraints(),
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0), // ou EdgeInsets.symmetric(horizontal: 20)
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      duration,
                      style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subtitleFirst,
                          style: TextStyle(
                            color: textColor.withOpacity(0.7),
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          subtitleSecond,
                          style: TextStyle(
                            color: textColor.withOpacity(0.7),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20,),

                     Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: iconColor,
                                size: 20,
                              ),
                              SizedBox(width: 5),

                              Text(
                                "24.234 Favorites",
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.headphones,
                                color: iconColor,
                                size: 20,
                              ),
                              const SizedBox(width: 5),

                              Text(
                                "34.234 Listening",
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10,),

                    Divider(
                      color: textColor.withOpacity(0.3),
                      thickness: 1,
                      height: 30,
                    ),

                    const SizedBox(height: 10,),

                     Text(
                      "Related",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10,),

                     Row(
                      children: [
                        Expanded(
                          child: CardMusic(
                            textColor: textColor,
                            title: "Moon Clouds",
                            duration: "45 MIN",
                            imageurl: "images/owls.png",
                          
                          ),
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          child: CardMusic(
                            textColor: textColor,
                            title: "Sweet sleep",
                            duration: "45 MIN",
                            imageurl: "images/night_island.png",
                          ),
                        ),
                      ],
                    ),


                    const Spacer(),


                    Container(
                      width: double.infinity, // Prend toute la largeur disponible
                      padding: const EdgeInsets.symmetric(vertical: 15), // Hauteur du bouton
                      decoration: BoxDecoration(
                        color: const Color(0xFF8E97FD), // Couleur violette/bleue
                        borderRadius: BorderRadius.circular(30), // Bords arrondis
                      ),
                      child: Text(
                        'PLAY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1, // Espacement des lettres
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
