// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_add_bloc.dart';

abstract class VehicleAddEvent {}

class VehicleUpdateImageFetched extends VehicleAddEvent{}

class LocationPickerVehilceAddEvent extends VehicleAddEvent {}

class ImageAddingButtonClicked extends VehicleAddEvent {}

class ImageRemoveButtonClicked extends VehicleAddEvent {
  int index;
  ImageRemoveButtonClicked({
    required this.index
  });
}

class FirstPageFinishVehilceAddEvent extends VehicleAddEvent {}
