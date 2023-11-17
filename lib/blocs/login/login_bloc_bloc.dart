import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/repositories/login_host_repo.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginClickedEvent>(loginClickedEvent);
  }

  FutureOr<void> loginClickedEvent(
      LoginClickedEvent event, Emitter<LoginBlocState> emit) async {
    emit(LoginLoadingState());

    final response = await HostLoginRepo().hostLogin(event.mailandpass);

    // ignore: avoid_print
    print("body:  ${response.body}---- statusCode: ${response.statusCode}");
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await SharedPreference.instance.storeToken(body['token']);
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
