import 'package:flutter/material.dart';

class CardMusic extends StatelessWidget {
  const CardMusic({
    super.key, required this.title, required this.duration, required this.imageurl, this.onTap, required this.textColor,
  });

  final String title;
  final String duration;
  final String imageurl;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start, // Texte aligné à gauche
        children: [
          SizedBox(
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
              height: 5), // Espace entre l'image et le texte
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            duration,
            style: TextStyle(
              fontSize: 14,
              color: textColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}