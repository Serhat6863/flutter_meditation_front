import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:meditation/features/auth/presentation/pages/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../bloc/auth_state.dart';
import '../widget/my_button.dart';
import '../widget/my_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isChecked = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AuthCubit authCubit;

  @override
  void initState() {
    // TODO: implement initState
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  Future<void> register() async {
    try {
      final String name = nameController.text.trim();
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();
      // Regular expression for email validation
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        if (emailRegex.hasMatch(email)) {
          await authCubit.register(email, name, password); // Appel asynchrone
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid email format')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill in all fields')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())));
    }
  }



  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthStates>(
      listener: (context, state){
        if(state is AuthError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      child: Scaffold(
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
                'Create your account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'SIGN UP WITH EMAIL',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  letterSpacing: 1.0,
                ),
              ),

              const SizedBox(height: 20),

              MyTextField(controller: nameController, hintText: 'Name', obscureText: false),

              const SizedBox(height: 20),

              // Email TextField
              MyTextField(controller: emailController, hintText: 'Email', obscureText: false),

              const SizedBox(height: 16),

              // Password TextField
             MyTextField(controller: passwordController, hintText: 'Password', obscureText: true),

              Row(
                  children: [
                      Text(
                          "I have read the",
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                          ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: Color(0xFF7583CA),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                          ),
                      ),
                      const Spacer(),
                      //checkbox
                      Checkbox(value: isChecked, onChanged: (value) {
                          setState(() {
                              isChecked = value!;
                          });
                      }),
                  ]
              ),

              const SizedBox(height: 24),

              // Login Button
              MyButton(
                text: 'SIGN UP',
                onPressed: () {
                  // Login user
                  register();
                },
                textColor: Colors.white,
                backgroundColor: const Color(0xFF7583CA),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

