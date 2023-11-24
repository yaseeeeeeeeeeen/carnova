import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/utils/functions/image_picker.dart';
import 'package:second_project/utils/functions/location_picker.dart';

part 'vehicle_add_event.dart';
part 'vehicle_add_state.dart';

class VehicleAddBloc extends Bloc<VehicleAddEvent, VehicleAddState> {
  VehicleAddBloc() : super(VehicleAddInitial()) {
    on<LocationPickerVehilceAddEvent>(locationPickerVehilceAdd);
    on<ImageAddingButtonClicked>(imageAddingButtonClicked);
    on<ImageRemoveButtonClicked>(imageRemoveButtonClicked);
  }

  FutureOr<void> locationPickerVehilceAdd(LocationPickerVehilceAddEvent event,
      Emitter<VehicleAddState> emit) async {
    emit(LoadingState());
    final locationData = await LocationPickService().getCurrentLocation();
    emit(LocationPickingSuccsessState(locationdata: locationData));
  }

  FutureOr<void> imageAddingButtonClicked(
      ImageAddingButtonClicked event, Emitter<VehicleAddState> emit) async {
    emit(LoadingState());
    final pickedXfile = await ImagePickService().pickCropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        imageSource: ImageSource.gallery);
    if (pickedXfile != null) {
      File image = File(pickedXfile.path);
      emit(ImagePickingSuccsess(
          pickedImage: image)); // Emitting the picked image
    } else {
      emit(
          ImagePickingFailed()); // Emitting failure state if image picking fails
    }
  }

  FutureOr<void> imageRemoveButtonClicked(
      ImageRemoveButtonClicked event, Emitter<VehicleAddState> emit) {
    
    emit(ImageRemovedSuccsessState(index: event.index));
  }
}
