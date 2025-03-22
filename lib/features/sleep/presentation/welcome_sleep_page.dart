import 'package:flutter/material.dart';
import 'package:meditation/features/auth/presentation/widget/my_button.dart';

class WelcomeSleepPage extends StatelessWidget {
  final VoidCallback onGetStarted; // Ajoute un paramètre callback

  const WelcomeSleepPage({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03174C),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              // Moon illustration
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("images/moon.png", height: 200),
                ],
              ),

              const SizedBox(height: 20),

              // Textes Welcome to Sleep
              const Text(
                "Welcome to Sleep",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                "Explore the new king of sleep",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 35),

              // Bird illustration
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("images/bird.png", height: 250),
                ],
              ),

              const Spacer(),

              // MyButton Get Started
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                child: MyButton(
                  text: "Get Started",
                  onPressed: onGetStarted, // Appelle la fonction passée
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
