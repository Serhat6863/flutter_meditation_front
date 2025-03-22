import 'package:flutter/material.dart';
import '../pages/register_screen.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF7583CA),
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
