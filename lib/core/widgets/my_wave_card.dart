import 'package:flutter/material.dart';

class MyWaveCard extends StatelessWidget {
  const MyWaveCard({
    super.key,
    required this.title,
    required this.duration,
    this.onPressed, required this.color, required this.textColor, required this.iconColor, this.image,
  });

  final String title;
  final String duration;
  final Color color;
  final Color textColor;
  final Color iconColor;
  final ImageProvider? image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            ),
            padding: const EdgeInsets.all(15),
            height: 100,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      duration,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: onPressed,
                    icon:  Icon(
                      Icons.play_arrow,
                      color: iconColor, // Couleur corrigée
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
