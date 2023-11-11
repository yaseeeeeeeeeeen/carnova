import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/host_side/data/network/api_services.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginClickedEvent>(loginClickedEvent);
  }

  FutureOr<void> loginClickedEvent(
      LoginClickedEvent event, Emitter<LoginBlocState> emit) async {
    emit(LoginLoadingState());
    final response = await ApiServiceHost.instance.hostLogin(event.mailandpass);
    // ignore: avoid_print
    print("body:  ${response.body}---- statusCode: ${response.statusCode}");
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      
      emit(LoginSuccsessState());
    } else if (response.statusCode == 400 &&
        body["message"] == "Wrong Password") {
      emit(LoginWrongPasswordState());
    } else if (response.statusCode == 400) {
      emit(LoginProcessState());
    } else if (response.statusCode == 404) {
      emit(LoginFailedState());
    } else {
      emit(LoginErrorState());
    }
  }
}
