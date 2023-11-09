part of 'otp_verfication_bloc.dart';

abstract class HostOtpVerficationState {}

final class HostOtpVerficationInitial extends HostOtpVerficationState {}

class HostOtpVerificationLoadingState extends HostOtpVerficationState {}

class HostOtpVerificationSuccsessState extends HostOtpVerficationState {}

class HostOtpVerificationFailedState extends HostOtpVerficationState {}
