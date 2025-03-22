import '../entities/person_entities.dart';

abstract class PersonRepository {
    //check if the person is registered
    Future<bool> isRegistered();
    //sign out
    Future<void> signOut();
    //login with email supabase
    Future<PersonEntity?> loginWithEmail(String email, String password);

    //register with email supabase  
    Future<PersonEntity?> registerWithEmail(String email, String password, String name);

    //get current user
    Future<PersonEntity?> getCurrentUser();


    //chek email if it exists
    Future<bool> checkEmail(String email);

}