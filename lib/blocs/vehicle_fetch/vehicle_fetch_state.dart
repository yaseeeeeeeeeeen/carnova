// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_fetch_bloc.dart';

abstract class VehicleFetchState {}

final class VehicleFetchInitial extends VehicleFetchState {}

class VehileDataLoading extends VehicleFetchState {}

class VehileDataSuccsess extends VehicleFetchState {
  List<VehicleFetchModal> verifiedVehicles;
  VehileDataSuccsess({required this.verifiedVehicles});
}

class VehileDataFailled extends VehicleFetchState {}
