import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/host_side/utils/image_picker.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc() : super(ProfileEditInitial()) {
    on<ImageAddedClicked>(imageAddedClicked);
  }

  FutureOr<void> imageAddedClicked(
      ImageAddedClicked event, Emitter<ProfileEditState> emit) async {
    final pickedimage = await ImagePickService().pickCropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        imageSource: ImageSource.gallery);
    if (pickedimage != null) {
      String imagePicked = pickedimage.path;
      emit(ProfileImageAddedState(imagePath: imagePicked));
    }
  }
}