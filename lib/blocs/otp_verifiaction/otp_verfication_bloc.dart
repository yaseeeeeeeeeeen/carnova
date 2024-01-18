import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:second_project/blocs/login/login_bloc_bloc.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/host_data_modal.dart';
import '../../repositories/host_repo.dart';
part 'otp_verfication_event.dart';
part 'otp_verfication_state.dart';

class HostOtpVerficationBloc
    extends Bloc<HostOtpVerficationEvent, HostOtpVerficationState> {
  late LoginBloc loginBloc;
  HostOtpVerficationBloc(this.loginBloc) : super(HostOtpVerficationInitial()) {
    on<OtpVerifyButtonClicked>(otpVerifyButtonClicked);
    on<DataGettedEvent>(dataGettedEvent);
  }

  FutureOr<void> otpVerifyButtonClicked(OtpVerifyButtonClicked event,
      Emitter<HostOtpVerficationState> emit) async {
    emit(HostOtpVerificationLoadingState());

    final response = await HostRepo().otpverificatio(event.otp);
    response.fold(
      (left) {
        emit(HostOtpVerificationFailedState(message: left.message));
      },
      (right) {
        String token = right['token'];
        SharedPreference.instance.storeToken(token);
        emit(HostOtpVerificationTokenGetState(token: token));
      },
    );
  }

  FutureOr<void> dataGettedEvent(
      DataGettedEvent event, Emitter<HostOtpVerficationState> emit) async {
    emit(HostOtpVerificationLoadingState());
    final hostDataResponse = await HostRepo().fetchHostData();
    hostDataResponse.fold(
      (left) {
        emit(HostOtpVerificationFailedState(message: left.message));
      },
      (right) {
        final data = HostModel.fromJson(right);
        locator<LoginBloc>().hostModelData = data;
        loginBloc.add(HostDashboardFetchEvent());
        emit(HostOtpVerificationSuccsessState());
      },
    );
  }
}
