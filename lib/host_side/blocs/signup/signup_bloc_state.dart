part of 'signup_bloc_bloc.dart';


abstract class SignupBlocState {}

final class SignupBlocInitial extends SignupBlocState {}

class SignupSuccsessState extends SignupBlocState{}

class SignupFaildState extends SignupBlocState{}

class SignupLoadingState extends SignupBlocState{}

class SignupErrorState extends SignupBlocState{}                                              

