// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_fetch_bloc.dart';

abstract class VehicleFetchState {}

final class VehicleFetchInitial extends VehicleFetchState {}

class VehileDataLoading extends VehicleFetchState {}

class VehileDataSuccsess extends VehicleFetchState {
  List<VehicleFetchModal> verifiedVehicles;
  List<VehicleFetchModal> pendingVehicles;
  VehileDataSuccsess(
      {required this.verifiedVehicles, required this.pendingVehicles});
}

class VehicleListEmptyState extends VehicleFetchState {}

class VehileDataFailled extends VehicleFetchState {
  String message;
  VehileDataFailled({required this.message});
}

class VehicleDeletedState extends VehicleFetchState {}

class VehicleDeleteFailedState extends VehicleFetchState {
  String messege;
  VehicleDeleteFailedState({
    required this.messege
  });
}
