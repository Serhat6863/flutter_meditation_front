

import '../../domain/entities/person_entities.dart';


abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class Authenticated extends AuthStates {
  final PersonEntity personEntity;

  Authenticated(this.personEntity);
}

class Unhenticated extends AuthStates {}

class AuthError extends AuthStates{
  final String message;

  AuthError(this.message);
}

class AuthSuccess extends AuthStates{
  final String message;

  AuthSuccess(this.message);
}

