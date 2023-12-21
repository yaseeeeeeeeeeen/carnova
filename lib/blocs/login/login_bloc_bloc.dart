import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/repositories/host_repo.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginClickedEvent>(loginClickedEvent);
    on<HostDetailsFetch>(hostDetailsFetch);
  }

  FutureOr<void> loginClickedEvent(
      LoginClickedEvent event, Emitter<LoginBlocState> emit) async {
    emit(LoginLoadingState());

    final response = await HostRepo().loginData(event.mailandpass);
    response.fold((error) {
      emit(LoginErrorState(messege: error.message));
    }, (response) {
      final token = response["token"];
      SharedPreference.instance.storeToken(token);
    });
    emit(LoginSuccsessState());
  }

  FutureOr<void> hostDetailsFetch(
      HostDetailsFetch event, Emitter<LoginBlocState> emit) async {
    final token = SharedPreference.instance.getToken();
    if (token != null) {
      final respo = await HostRepo().fetchHostData();
      respo.fold((left) {
        emit(LoginErrorState(messege: left.message));
      }, (right) {
        HostModel host = HostModel.fromJson(right);
        hostModelData = host;
        emit(LoginDataFetchState());
      });
    } else {
      emit(LoginFailedState());
    }
  }
}
