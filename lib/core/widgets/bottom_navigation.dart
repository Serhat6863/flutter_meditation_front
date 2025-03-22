import 'package:flutter/material.dart';
import 'package:meditation/features/meditation/presentation/meditation_page.dart';
import 'package:meditation/features/home/presentation/pages/music_page.dart';
import 'package:meditation/features/profile/presentation/profile_page.dart';
import 'package:meditation/features/sleep/presentation/sleep_page.dart';
import 'package:meditation/features/sleep/presentation/welcome_sleep_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/presentation/pages/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);


  static const String _isFirstVisitSleepPage = "isFirstVisitSleepPage";

  //method to set the value of isFirstVisitSleepPage
  static Future<bool> isFirstVisitSleepPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(_isFirstVisitSleepPage) ?? true;
    debugPrint("isFirstVisitSleepPage: $result");
    return result;
  }

  //method to update the value of isFirstVisitSleepPage
  static Future<void> updateIsFirstVisitSleepPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstVisitSleepPage, false);
  }


  List<PersistentBottomNavBarItem> _navbarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home, size: 30), // Augmente la taille de l'icône
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Ajuste la taille et le style du texte
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.safety_check, size: 30),
        title: ("Sleep"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, size: 30),
        title: ("Meditate"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.music_note, size: 30),
        title: ("Music"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, size: 30),
        title: ("Profile"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ];
  }

  Color _getBackgroundColor() {
    print(_controller.index);
    if(_controller.index == 1){
      return const Color(0xFF03174C);
    }else if(_controller.index != 1){
      return Colors.white;
    }

    return Colors.white;
  }


  final List<Widget> _screens = [
    const HomePage(),
    const SleepPage(), // Place SleepPage par défaut
    const MeditationPage(),
    const MusicPage(),
    const ProfilePage(),
  ];


  void _handleTabChange(int index) async {
    if (index == 1) { // Onglet Sleep
      final isFirstVisit = await isFirstVisitSleepPage();
      if (isFirstVisit) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeSleepPage(
            onGetStarted: () async {
              await updateIsFirstVisitSleepPage(); // Met à jour l'état
              Navigator.pop(context); // Retourne à la navigation précédente
              setState(() {}); // Force la mise à jour pour refléter l'état
            },
          )),
        );
        return; // Empêche le changement direct d'onglet
      }
    }
  }





  PersistentTabView _buildScreens(){
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navbarItems(),
      confineToSafeArea: true,
      backgroundColor: _getBackgroundColor(), // Couleur de fond
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Couleur de l'ombre
            spreadRadius: 1, // Étendue de l'ombre
            blurRadius: 8,   // Flou de l'ombre
            offset: const Offset(0, -2), // Position verticale de l'ombre (vers le haut)
          ),
        ],
        colorBehindNavBar: Colors.white, // Couleur derrière la barre
      ),
      navBarHeight: 80,
      navBarStyle: NavBarStyle.style1, // Pour conserver un bon alignement
      onItemSelected: (index) {
        _handleTabChange(index);
        setState(() {
          _controller.index = index;
        });
      },
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens(),
    );
  }
}



