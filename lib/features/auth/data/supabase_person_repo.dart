import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/entities/person_entities.dart';
import '../domain/repository/person_repository.dart';

class SupabaseRepo extends PersonRepository {

  final supabase = Supabase.instance.client;

  @override
  Future<PersonEntity?> loginWithEmail(String email, String password) async {
    try{
      final response = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );

      final User? user = response.user;
      final Session? session = response.session;


      if(user!= null && session != null){
        return PersonEntity(
          uid: user.id,
          email: user.email ?? '',
          name: user.userMetadata?['name'] ?? '',
        );
      }else{
        throw Exception("Login failed : user or session is null");
      }



    }catch(e){
      throw Exception("erreur in the login ${e.toString()}");
    }
  }


  @override
  Future<PersonEntity?> registerWithEmail(String email, String password, String name) async {
    try {
      print("hello im here");

      // Juste avant l'appel à signUp
      print("Attempting to sign up with email: $email and password: $password");

      final response = await supabase.auth.signUp(
        password: password.trim(),
        email: email.trim(),
        data: {
          'name': name.trim(),
        },
      );


      final Session? session = response.session;
      final User? user = response.user;

      print("User: $user, Session: $session");

      if (user != null && session != null) {
        print("User registered successfully: ${user.email}");
        return PersonEntity(
          uid: user.id,
          email: user.email ?? '',
          name: user.userMetadata?['name'] ?? '',
        );
      } else {
        print("Either user or session is null");
        throw Exception("Registration failed: user or session is null");
      }
    } catch (e, stackTrace) {
      print("Exception caught: $e");
      print("Stack trace: $stackTrace");
      throw Exception("Erreur lors de l'inscription : ${e.toString()}");
    }
  }


  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  @override
  Future<bool> isRegistered() async {
    final user = supabase.auth.currentUser;
    return user != null;
  }

  @override
  Future<PersonEntity?> getCurrentUser() async {
    final user = supabase.auth.currentUser;
    return user != null ? PersonEntity(uid: user.id, email: user.email ?? '', name: user.userMetadata?['name'] ?? '') : null;
  }


  @override
  Future<bool> checkEmail(String email) async {
    try {
      // Requête vers la table 'users' pour vérifier si un e-mail existe
      final response = await Supabase.instance.client
          .from('users')
          .select('id') // Récupère uniquement l'ID pour limiter les données renvoyées
          .eq('email', email)
          .limit(1) // Limite la requête à 1 résultat pour optimiser
          .maybeSingle();

      // Si aucune donnée n'est renvoyée, l'e-mail n'existe pas
      if (response == null) {
        print('Email does not exist: $email');
        return false;
      }

      print('Email exists: $email');
      return true;
    } catch (e) {
      print('Error checking email: $e');
      return false; // Retourne `false` en cas d'erreur pour éviter des crashs
    }
  }





}