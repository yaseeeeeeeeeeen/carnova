import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/repositories/host_data_repo.dart';

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
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      String token = body['token'];
      print(token);
      await SharedPreference.instance.storeToken(token);
      final userData = await HostDataRepo().getHostData();
      print('user data $userData');
      if (userData == null) return null;
      final data = HostModel.fromJson(userData);
      hostModelData = data;
      emit(HostOtpVerificationSuccsessState());
    } else {
      emit(HostOtpVerificationFailedState());
    }
  }
}
