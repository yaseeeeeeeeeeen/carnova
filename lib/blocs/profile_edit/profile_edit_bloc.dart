import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/repositories/host_repo.dart';
import 'package:second_project/utils/functions/image_picker.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc() : super(ProfileEditInitial()) {
    on<ImageAddedClicked>(imageAddedClicked);
    on<SubmitClicked>(submitClicked);
  }

  FutureOr<void> imageAddedClicked(
      ImageAddedClicked event, Emitter<ProfileEditState> emit) async {
    final pickedimage = await ImagePickService().pickCropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        imageSource: ImageSource.gallery);
    if (pickedimage != null) {
      File imagePicked = File(pickedimage.path);
      // hostModelData?.profile = pickedimage as File;
      emit(ProfileImageAddedState(imagePath: imagePicked));
    }
  }

  FutureOr<void> submitClicked(
      SubmitClicked event, Emitter<ProfileEditState> emit) async {
    emit(SubmitLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final response = await ApiServiceHost.instance.profileUpdate(event.image);
    // final responsBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final response = await HostRepo().fetchHostData();
      response.fold((left) {
        emit(SubmitFailedState());
      }, (right) {
        HostModel data = HostModel.fromJson(right);
        hostModelData = data;
        emit(SubmitSuccsessState());
      });
  
    }
  }
}
