// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_verfication_bloc.dart';

abstract class HostOtpVerficationEvent {}

class OtpVerifyButtonClicked extends HostOtpVerficationEvent {
  final int intOtp;
  Map<String, int> otp;

  OtpVerifyButtonClicked({required this.intOtp}) : otp = {"otp": intOtp};
}

class DataGettedEvent extends HostOtpVerficationEvent {
  String token;
  DataGettedEvent({
    required this.token
  });
}
