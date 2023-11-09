part of 'otp_verfication_bloc.dart';

abstract class HostOtpVerficationEvent {}

class OtpVerifyButtonClicked extends HostOtpVerficationEvent {
  final int intOtp;
  Map<String, int> otp;

  OtpVerifyButtonClicked({required this.intOtp}) : otp = {"otp": intOtp};
}

