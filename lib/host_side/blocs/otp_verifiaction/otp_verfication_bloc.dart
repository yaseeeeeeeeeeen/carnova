import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:second_project/host_side/data/network/api_services.dart';

part 'otp_verfication_event.dart';
part 'otp_verfication_state.dart';

class HostOtpVerficationBloc
    extends Bloc<HostOtpVerficationEvent, HostOtpVerficationState> {
  HostOtpVerficationBloc() : super(HostOtpVerficationInitial()) {
    on<OtpVerifyButtonClicked>(otpVerifyButtonClicked);
  }

  FutureOr<void> otpVerifyButtonClicked(OtpVerifyButtonClicked event,
      Emitter<HostOtpVerficationState> emit) async {
    emit(HostOtpVerificationLoadingState());
    final response = await ApiServiceHost.instance.hostOtp(event.otp);
    if (response.statusCode == 200) {
      emit(HostOtpVerificationSuccsessState());
    } else {
      emit(HostOtpVerificationFailedState());
    }
  }
}
