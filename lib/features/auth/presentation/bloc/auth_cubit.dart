import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/supabase_person_repo.dart';
import 'auth_state.dart';




class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  final SupabaseRepo authRepository = SupabaseRepo();


  Future<void> login(String email, String password) async{
    try{
      emit(AuthLoading());
      final user = await authRepository.loginWithEmail(email, password);
      if(user != null){
        emit(Authenticated(user));
      }else{
        emit(Unhenticated());
      }
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(String email, String name, String password) async{
    try{
      emit(AuthLoading());

      final emailExist = await authRepository.checkEmail(email);

      if(emailExist){
        emit(AuthError('Email already exists'));
        return;
      }

      final user = await authRepository.registerWithEmail(email, password, name);
      if(user != null){
        emit(AuthSuccess('Account created successfully'));
      }else{
        emit(Unhenticated());
      }
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async{
    try{
      emit(AuthLoading());
      await authRepository.signOut();
      emit(Unhenticated());
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }

  Future<void> checkAuth() async{
    try{
      emit(AuthLoading());
      final user = await authRepository.getCurrentUser();
      if(user != null){
        emit(Authenticated(user));
      }else{
        emit(Unhenticated());
      }
    }catch(e){
      emit(AuthError(e.toString()));
    }
  }





}
