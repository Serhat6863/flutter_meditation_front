import 'package:flutter/material.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1145), // Bleu très foncé
      body: Stack(
        children: [
          // Arrière-plan avec des cercles flous
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),

          // Contenu principal
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Barre supérieure
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.favorite_border, color: Colors.white),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.download_outlined, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Titre et sous-titre
                  const Text(
                    "Night Island",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "SLEEP MUSIC",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),

                  const Spacer(),

                  // Contrôles de lecture
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.replay_10_outlined, color: Colors.white, size: 28),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.pause, color: Color(0xFF0A1145), size: 35),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.forward_10_outlined, color: Colors.white, size: 28),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Barre de progression
                  Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white.withOpacity(0.2),
                          thumbColor: Colors.white,
                          overlayColor: Colors.white.withOpacity(0.2),
                        ),
                        child: Slider(
                          value: 0.2,
                          onChanged: (value) {},
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "01:30",
                              style: TextStyle(color: Colors.white60),
                            ),
                            Text(
                              "45:00",
                              style: TextStyle(color: Colors.white60),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}