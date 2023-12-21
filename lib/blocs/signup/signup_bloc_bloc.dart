import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/repositories/host_repo.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  SignupBloc() : super(SignupBlocInitial()) {
    on<SignupClickedEvent>(signupClickedEvent);
  }

  FutureOr<void> signupClickedEvent(
      SignupClickedEvent event, Emitter<SignupBlocState> emit) async {
    emit(SignupLoadingState());
    final response = await HostRepo().signup(event.signupData);
    response.fold((left) {
      emit(SignupFaildState());
    }, (right)  {
     HostRepo().fetchHostData();
      emit(SignupSuccsessState());
    });
  }
}
