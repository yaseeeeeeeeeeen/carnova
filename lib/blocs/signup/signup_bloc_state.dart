// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc_bloc.dart';

abstract class SignupBlocState {}

final class SignupBlocInitial extends SignupBlocState {}

class SignupSuccsessState extends SignupBlocState {}

class SignupFaildState extends SignupBlocState {
  String messege;
  SignupFaildState({
    required this.messege
  });
}

class SignupLoadingState extends SignupBlocState {}

class SignupErrorState extends SignupBlocState {}
