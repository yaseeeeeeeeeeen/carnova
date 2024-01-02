import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:second_project/repositories/host_repo.dart';

part 'password_settings_event.dart';
part 'password_settings_state.dart';

class PasswordSettingsBloc
    extends Bloc<PasswordSettingsEvent, PasswordSettingsState> {
  PasswordSettingsBloc() : super(PasswordSettingsInitial()) {
    on<ResetPassword>(resetPassword);
    on<ForgetPassword>(forgetPassword);
  }

  FutureOr<void> resetPassword(
      ResetPassword event, Emitter<PasswordSettingsState> emit) async {
    emit(PasswordChangeLoading());
    final data = {
      "oldPass": event.oldpassword,
      "password": event.newpassword,
      "confirmPass": event.confirmpassword,
    };
    final response = await HostRepo().resetPassword(data);
    response.fold((left) {
      emit(PasswordChangeFailed(messege: left.message));
    }, (right) {
      emit(PasswordChangeSuccsess());
    });
  }

  FutureOr<void> forgetPassword(
      ForgetPassword event, Emitter<PasswordSettingsState> emit) async {
    emit(PasswordChangeLoading());
  }
}
