import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/host_side/data/network/api_services.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  SignupBloc() : super(SignupBlocInitial()) {
    on<SignupClickedEvent>(signupClickedEvent);
  }

  FutureOr<void> signupClickedEvent(
      SignupClickedEvent event, Emitter<SignupBlocState> emit) async {
    emit(SignupLoadingState());
    final response = await ApiServiceHost.instance.hostSignup(event.signupData);
    if (response.statusCode == 200) {
      emit(SignupSuccsessState());
    } else {
      emit(SignupFaildState());
    }
  }
}
