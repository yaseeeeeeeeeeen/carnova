import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';


import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/host_data_modal.dart';

import '../../repositories/host_repo.dart';

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
    final response = await HostRepo().otpverificatio(event.otp);
    response.fold((left) {
       emit(HostOtpVerificationFailedState(message: left.message));
    }, (right) {
                String token = right['token'];
                 SharedPreference.instance.storeToken(token);
                   final response =  HostRepo().fetchHostData();
                      response.fold((left) {
        emit(HostOtpVerificationFailedState(message: left.message));
      }, (right) {
        final data = HostModel.fromJson(right);
        hostModelData = data;
      });
    });
  
    }
  }

