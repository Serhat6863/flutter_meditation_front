import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation/core/constants/app_constant.dart';
import 'package:meditation/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:meditation/features/auth/presentation/pages/login_screen.dart';
import '../widget/my_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: AppConstant.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3A59),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Silent",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            Image.asset("images/diamond.png", height: 20),
            const SizedBox(width: 5),
            const Text(
              "Moon",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              //authCubit.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Header Text
            const Text(
              "Good Morning, User",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A3A3A),
              ),
            ),
            const Text(
              "We Wish you have a good day",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF8E8E93),
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal Cards (Basics & Relaxation)
            Row(
              children: [
                Expanded(
                  child: BuildCard(
                    title: "Basics",
                    subtitle: "Course",
                    duration: "3-10 MIN",
                    color: const Color(0xFFE8EAF6),
                    icon: Icons.self_improvement,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: BuildCard(
                    title: "Relaxation",
                    subtitle: "Music",
                    duration: "3-10 MIN",
                    color: const Color(0xFFFBE9E7),
                    icon: Icons.music_note,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Daily Thought Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2E3A59),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daily Thought",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Meditation • 3-10 MIN",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recommended for You Section
            const Text(
              "Recommended for you",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A3A3A),
              ),
            ),
            const SizedBox(height: 15),

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 160, // Largeur de chaque carte
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6E7F2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Container(
                            height: 100,
                            color: const Color(0xFF2E3A59),
                            child: Image.asset(
                              "images/meditation.png",
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Meditation ${index + 1}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3A3A3A),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "5-10 MIN",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8E8E93),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}