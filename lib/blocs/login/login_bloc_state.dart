// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc_bloc.dart';

abstract class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

class LoginLoadingState extends LoginBlocState {}

class LoginProcessState extends LoginBlocState {}

class LoginSuccsessState extends LoginBlocState {}

class LoginWrongPasswordState extends LoginBlocState {}

class LoginFailedState extends LoginBlocState {
  String message;
  LoginFailedState({required this.message});
}

class LoginDataFetchState extends LoginBlocState {}

class HostDashbordFetched extends LoginBlocState {}

class LoginErrorState extends LoginBlocState {
  String messege;
  LoginErrorState({
    required this.messege,
  });
}

class ForgetPasswordSuccsessMail extends LoginBlocState {
  String id;
  ForgetPasswordSuccsessMail({
    required this.id
  });
}
class PasswordResetedSuccsess extends LoginBlocState{}
