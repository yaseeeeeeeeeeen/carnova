part of 'signup_bloc_bloc.dart';

abstract class SignupBlocEvent {}

class SignupClickedEvent extends SignupBlocEvent {
final  Map<String, Object> signupData;

  SignupClickedEvent({required this.signupData});

}
