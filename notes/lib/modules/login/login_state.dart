import 'models/user_model.dart';

abstract class LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateFailure extends LoginState {
  LoginStateFailure({required this.message});
  final String message;
}

class LoginStateSuccess extends LoginState {
  LoginStateSuccess({required this.user});
  final UserModel user;
}
