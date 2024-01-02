// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent {}

class ImageAddedClicked extends ProfileEditEvent {}

class SubmitClicked extends ProfileEditEvent {
  File? image;
  Map<String, dynamic> data;
  SubmitClicked({this.image,required this.data});
}

class UpdataHostDetails extends ProfileEditEvent{}