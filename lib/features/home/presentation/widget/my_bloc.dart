import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.color,
    required this.icon,
    required this.onTap
  });

  final String title;
  final String subtitle;
  final String duration;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Enlevé l'Expanded ici
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.black54, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A3A3A),
              ),
            ),
            Text(
              subtitle.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF8E8E93),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}