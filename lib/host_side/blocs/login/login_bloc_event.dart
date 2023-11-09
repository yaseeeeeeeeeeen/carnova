part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent {}

class LoginClickedEvent extends LoginBlocEvent {

Map<String, String> mailandpass;
  LoginClickedEvent({required this.mailandpass});
  
}
