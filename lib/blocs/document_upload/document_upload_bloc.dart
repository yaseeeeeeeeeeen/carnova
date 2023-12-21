import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/modals/vehicle_add_modal.dart';
import 'package:second_project/repositories/vehicle_repo.dart';
import 'package:second_project/utils/functions/image_picker.dart';
import 'package:second_project/utils/functions/string_to_file.dart';

part 'document_upload_event.dart';
part 'document_upload_state.dart';

class DocumentUploadBloc
    extends Bloc<DocumentUploadEvent, DocumentUploadState> {
  DocumentUploadBloc() : super(DocumentUploadInitial()) {
    on<DocumentUploadClicked>(documentUploadClicked);
    on<ImageClearButton>(imageClearButtonClicked);
    on<DocumentSubmitClicked>(documentSubmitClicked);
    on<VehicleUpdateDocumnet>(vehicleUpdateDocumnet);
    on<UpdateVehicleClicked>(updateVehicleClicked);
  }

  FutureOr<void> documentUploadClicked(
      DocumentUploadClicked event, Emitter<DocumentUploadState> emit) async {
    final pickedimage = await ImagePickService().pickCropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        imageSource: ImageSource.gallery);
    if (pickedimage != null) {
      emit(DocumentUploadSuccsessState(imagePath: File(pickedimage.path)));
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
    Future.delayed(const Duration(seconds: 2));
    final data = event.vehicledata.toJson();
    final response =
        await VehicleAddRepo().addVehicle(data, event.vehicleImages, event.doc);
    print(response.statusCode);

    //api upload

    emit(DocumentAllSuccsessState());
  }

  FutureOr<void> vehicleUpdateDocumnet(
      VehicleUpdateDocumnet event, Emitter<DocumentUploadState> emit) async {
    emit(DocumentUploadLoadingState());
    List<String> imgUrl = [event.imageUrl];
    final data = await convertingStringtoImage(imgUrl);

    if (data.isNotEmpty) {
      File document = data[0];
      emit(DocumentUploadSuccsessState(imagePath: document));
    } else {
      emit(DocumentUploadFailedState());
    }
  }

  FutureOr<void> updateVehicleClicked(UpdateVehicleClicked event, Emitter<DocumentUploadState> emit)async {
    
  }
}
