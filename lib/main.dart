import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:meditation/features/auth/presentation/bloc/auth_state.dart';
import 'package:meditation/core/widgets/bottom_navigation.dart';
import 'features/auth/presentation/pages/onboarding_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ovvienowtihewffcfpch.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im92dmllbm93dGloZXdmZmNmcGNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMwNjg1OTAsImV4cCI6MjA0ODY0NDU5MH0.4kEyeKwCIazsp4nL1ZCLsuPkSb8QgSlhbNkvqg5J3Kw',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..checkAuth(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen()
      ),
    );
  }
}
