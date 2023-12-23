// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_add_bloc.dart';

abstract class VehicleAddState {}

final class VehicleAddInitial extends VehicleAddState {}

class VehicleUpdateImageSuccsess extends VehicleAddState {
  List<File> images;
  VehicleUpdateImageSuccsess({required this.images});
}

class LoadingState extends VehicleAddState {}

class LocationPickingFaildState extends VehicleAddState {}

class LocationPickingSuccsessState extends VehicleAddState {
  Map<dynamic, dynamic> locationdata;
  LocationPickingSuccsessState({required this.locationdata});
}

class VehivleAddPageOneFaildState extends VehicleAddState {}

class VehivleAddPageOneSuccsessState extends VehicleAddState {}

//////////////////////////////// Vehicle Screen 2////////////////////////////////////////////////

class ImagePickingSuccsess extends VehicleAddState {
  File pickedImage;
  ImagePickingSuccsess({required this.pickedImage});
}

class ImagePickingFailed extends VehicleAddState {}

class ImageRemovedSuccsessState extends VehicleAddState {
  int index;
  ImageRemovedSuccsessState({required this.index});
}

class ImageRemovedFailedState extends VehicleAddState {
  String messege;
  ImageRemovedFailedState({required this.messege});
}

class ImagesFetchSuccsessState extends VehicleAddState {}

class VehicleUpdateSuccsessState extends VehicleAddState {}

class VehicleUpdateFailedState extends VehicleAddState {}
