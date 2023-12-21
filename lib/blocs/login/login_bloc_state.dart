// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc_bloc.dart';

abstract class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

class LoginLoadingState extends LoginBlocState {}

class LoginProcessState extends LoginBlocState {}

class LoginSuccsessState extends LoginBlocState {}

class LoginWrongPasswordState extends LoginBlocState {}

class LoginFailedState extends LoginBlocState {}
class LoginDataFetchState extends LoginBlocState{}

class LoginErrorState extends LoginBlocState {
  String messege;
  LoginErrorState({
    required this.messege,
  });
}
