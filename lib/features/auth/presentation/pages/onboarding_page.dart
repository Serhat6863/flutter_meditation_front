import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import '../widget/my_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Logo et titre
              const Text(
                "Silent Moon",  
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // Illustration
              Image.asset(
                'images/onboarding_illustration.png',
                height: 300,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              // Textes
              const Text(
                'We are what we do',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              const Text(
                'Thousand of people are using silent moon for smalls meditation',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Bouton Sign Up
              MyButton(
                text: 'SIGN UP',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                },
                textColor: Colors.white,
              ),

              const SizedBox(height: 20),

              // Texte Login
              GestureDetector(
                onTap: () {
                  // Navigation vers Login
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'ALREADY HAVE AN ACCOUNT? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'LOG IN',
                        style: TextStyle(
                          color: Color(0xFF7583CA),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
