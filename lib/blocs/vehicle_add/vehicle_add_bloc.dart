import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/repositories/host_repo.dart';
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
    }
    }

  FutureOr<void> vehicleUpdateImages(
      VehicleUpdateImages event, Emitter<VehicleAddState> emit) async {
    final images = await convertingStringtoImage(event.imageUrls);
    emit(VehicleUpdateImageSuccsess(images: images));
    emit(ImagesFetchSuccsessState());
  }

  FutureOr<void> vehicleUpdateEvent(
      VehicleUpdateEvent event, Emitter<VehicleAddState> emit) async {}
}
