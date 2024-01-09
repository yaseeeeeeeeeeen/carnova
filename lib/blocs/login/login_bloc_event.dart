// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent {}

class LoginClickedEvent extends LoginBlocEvent {
  Map<String, String> mailandpass;
  LoginClickedEvent({required this.mailandpass});
}

class HostDetailsFetch extends LoginBlocEvent {}

class HostDashboardFetchEvent extends LoginBlocEvent {}

class ForgetPasswordMailSubmited extends LoginBlocEvent {
  String email;
  ForgetPasswordMailSubmited({required this.email});
}

class ResetPasswordWithId extends LoginBlocEvent {
  String id;
  String pass1;
  String pass2;
  ResetPasswordWithId(
      {required this.id, required this.pass1, required this.pass2});
}
