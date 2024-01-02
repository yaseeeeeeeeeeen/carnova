// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_edit_bloc.dart';

abstract class ProfileEditState {}

final class ProfileEditInitial extends ProfileEditState {}

class ProfileUpdateFailedState extends ProfileEditState {
  String messege = "Profile Photo Update Failed";
}

class ProfileImageAddedState extends ProfileEditState {
  File imagePath;
  ProfileImageAddedState({
    required this.imagePath,
  });
}

class HostDataUpdateSuccsess extends ProfileEditState {}

class HostDataUpdateFailed extends ProfileEditState {
  String messege;
  HostDataUpdateFailed({required this.messege});
}

class SubmitLoadingState extends ProfileEditState {}

class SubmitSuccsessState extends ProfileEditState {}

class SubmitFailedState extends ProfileEditState {
  String messege;
  SubmitFailedState({required this.messege});
}
