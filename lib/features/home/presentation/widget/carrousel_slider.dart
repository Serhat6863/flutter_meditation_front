import 'package:flutter/material.dart';

class CarrouselSlider extends StatelessWidget {
  const CarrouselSlider({super.key, required this.title, required this.subtitle, required this.imagePath});

  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3A3A3A),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF8E8E93),
            ),
          ),
        ],
      ),
    );
  }
}
