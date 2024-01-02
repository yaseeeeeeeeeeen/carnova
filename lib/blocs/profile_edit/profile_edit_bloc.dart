import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/repositories/host_repo.dart';
import 'package:second_project/utils/functions/image_picker.dart';
import 'package:second_project/utils/functions/string_to_file.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  File? imagePath;
  final hostModelData = getLoggedInHost();
  ProfileEditBloc() : super(ProfileEditInitial()) {
    on<ImageAddedClicked>(imageAddedClicked);
    on<SubmitClicked>(submitClicked);
    on<UpdataHostDetails>(updataHostDetails);
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
    if (event.image == null) {
      List<String> imageUrls = [hostModelData.profile];
      final img = await convertingStringtoImage(imageUrls);
      imagePath = img[0];
    } else {
      imagePath = event.image;
    }
    final response = await ApiServiceHost.instance.profileUpdate(imagePath!);
    if (response.statusCode == 200) {
      final response1 = await HostRepo().updateData(event.data);
      response1.fold((left) {
        emit(HostDataUpdateFailed(messege: left.message));
      }, (right) {
        emit(HostDataUpdateSuccsess());
      });
    } else {
      emit(ProfileUpdateFailedState());
    }
  }

  FutureOr<void> updataHostDetails(
      UpdataHostDetails event, Emitter<ProfileEditState> emit) async {
    final response = await HostRepo().fetchHostData();
    response.fold((left) {
      emit(SubmitFailedState(messege: left.message));
    }, (right) {
      HostModel data = HostModel.fromJson(right);

      replaceUserData(data);
      emit(SubmitSuccsessState());
    });
  }
}
