import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/repositories/vehicle_repo.dart';
import 'package:second_project/utils/functions/image_picker.dart';
import 'package:second_project/utils/functions/location_picker.dart';
import 'package:second_project/utils/functions/string_to_file.dart';

part 'vehicle_add_event.dart';
part 'vehicle_add_state.dart';

class VehicleAddBloc extends Bloc<VehicleAddEvent, VehicleAddState> {
  VehicleAddBloc() : super(VehicleAddInitial()) {
    on<LocationPickerVehilceAddEvent>(locationPickerVehilceAdd);
    on<ImageAddingButtonClicked>(imageAddingButtonClicked);
    on<ImageRemoveButtonClicked>(imageRemoveButtonClicked);
    on<VehicleUpdateImages>(vehicleUpdateImages);
    on<VehicleUpdateEvent>(vehicleUpdateEvent);
    on<ImageRemoveVehicleAddTime>(imageRemoveVehicleAddTime);
  }

  FutureOr<void> locationPickerVehilceAdd(LocationPickerVehilceAddEvent event,
      Emitter<VehicleAddState> emit) async {
    emit(LoadingState());
    final locationData = await LocationPickService().getCurrentLocation();
    emit(LocationPickingSuccsessState(locationdata: locationData));
  }

  FutureOr<void> imageAddingButtonClicked(
      ImageAddingButtonClicked event, Emitter<VehicleAddState> emit) async {
    final pickedXfile = await ImagePickService().pickCropImage(
        cropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        imageSource: ImageSource.gallery);
    if (pickedXfile != null) {
      File image = File(pickedXfile.path);

      emit(ImagePickingSuccsess(pickedImage: image));
      emit(ImagesFetchSuccsessState()); // Emitting the picked image
    } else {
      emit(
          ImagePickingFailed()); // Emitting failure state if image picking fails
    }
  }

  FutureOr<void> imageRemoveButtonClicked(
      ImageRemoveButtonClicked event, Emitter<VehicleAddState> emit) async {
    final token = SharedPreference.instance.getToken();
    final response = await ApiService()
        .deleteVehicleImages(event.vehicleId, event.imageId, token!);
    if (response.statusCode == 200) {
      emit(ImageRemovedSuccsessState(index: event.index));
      emit(ImagesFetchSuccsessState());
    } else {

    }
  }

  FutureOr<void> vehicleUpdateImages(
      VehicleUpdateImages event, Emitter<VehicleAddState> emit) async {
    final images = await convertingStringtoImage(event.imageUrls);
    emit(VehicleUpdateImageSuccsess(images: images));
    emit(ImagesFetchSuccsessState());
  }

  FutureOr<void> vehicleUpdateEvent(
      VehicleUpdateEvent event, Emitter<VehicleAddState> emit) async {
    emit(LoadingState());
    Map<String, dynamic> vehicleData = event.data.toJson();
    final response = await VehicleAddRepo()
        .editVehicle(event.vehicleId, vehicleData, event.newaddedImages);
    if (response.statusCode == 200) {
      emit(VehicleUpdateSuccsessState());
    } else {
      emit(VehicleUpdateFailedState());
    }
  }

  FutureOr<void> imageRemoveVehicleAddTime(
      ImageRemoveVehicleAddTime event, Emitter<VehicleAddState> emit) {
    emit(ImageRemovedSuccsessState(index: event.index));
    emit(ImagesFetchSuccsessState());
  }
}
