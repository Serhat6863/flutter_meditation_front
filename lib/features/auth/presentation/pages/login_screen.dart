import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:meditation/core/widgets/bottom_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/auth_state.dart';
import '../widget/my_button.dart';
import '../widget/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AuthCubit authCubit;


  void login(){
    try{
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      if(email.isNotEmpty && password.isNotEmpty){
        authCubit.login(email, password);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in all fields')));
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        //center the content
        child: Column(
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              'LOG IN WITH EMAIL',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                letterSpacing: 1.0,
              ),
            ),

              const SizedBox(height: 20),

            // Email TextField
            MyTextField(controller: emailController, hintText: 'Email address', obscureText: false),

            const SizedBox(height: 16),

            // Password TextField
            MyTextField(controller: passwordController, hintText: 'Password', obscureText: true),

            const SizedBox(height: 24),

            // Login Button
            MyButton(
              text: 'LOG IN',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavigation()),
                );
              },
              textColor: Colors.white,
              backgroundColor: const Color(0xFF7583CA),
            ),

            const SizedBox(height: 16),



            // Forgot Password
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to forgot password screen
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Sign Up Link
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "DON'T HAVE AN ACCOUNT? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'SIGN UP',
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
    );
  }
}
