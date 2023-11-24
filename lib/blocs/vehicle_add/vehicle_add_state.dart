// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_add_bloc.dart';

abstract class VehicleAddState {}

final class VehicleAddInitial extends VehicleAddState {}

class LoadingState extends VehicleAddState {}

class LocationPickingFaildState extends VehicleAddState {}

class LocationPickingSuccsessState extends VehicleAddState {
  Map<dynamic, dynamic> locationdata;
  LocationPickingSuccsessState({required this.locationdata});
}

class VehivleAddPageOneFaildState extends VehicleAddState {}

class VehivleAddPageOneSuccsessState extends VehicleAddState {}
