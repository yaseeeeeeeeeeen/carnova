part of 'login_bloc_bloc.dart';

abstract class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

class LoginLoadingState extends LoginBlocState{}

class LoginProcessState extends LoginBlocState{}

class LoginSuccsessState extends LoginBlocState{}

class LoginFailedState extends LoginBlocState{}

class LoginErrorState extends LoginBlocState{}