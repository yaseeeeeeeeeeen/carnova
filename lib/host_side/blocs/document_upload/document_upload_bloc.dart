import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/host_side/utils/image_picker.dart';

part 'document_upload_event.dart';
part 'document_upload_state.dart';

class DocumentUploadBloc
    extends Bloc<DocumentUploadEvent, DocumentUploadState> {
  DocumentUploadBloc() : super(DocumentUploadInitial()) {
    on<DocumentUploadClicked>(documentUploadClicked);
    on<ImageClearButton>(imageClearButtonClicked);
    on<DocumentSubmitClicked>(documentSubmitClicked);
  }

  FutureOr<void> documentUploadClicked(
      DocumentUploadClicked event, Emitter<DocumentUploadState> emit) async {
    final pickedimage = await ImagePickService().pickCropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        imageSource: ImageSource.gallery);
    if (pickedimage != null) {
      String imagePicked = pickedimage.path;
      emit(DocumentUploadSuccsessState(imagePath: imagePicked));
    } else {
      emit(DocumentUploadFailedState());
    }
  }

  FutureOr<void> imageClearButtonClicked(
      ImageClearButton event, Emitter<DocumentUploadState> emit) {
    emit(DocumentClearedState());
  }

  FutureOr<void> documentSubmitClicked(
      DocumentSubmitClicked event, Emitter<DocumentUploadState> emit) async {
    emit(DocumentUploadLoadingState());

    //api upload

//     emit(DocumentAllSuccsessState());
  }
}
