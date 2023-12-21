// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_fetch_bloc.dart';

abstract class VehicleFetchEvent {}

class VehicleDataFetchEvent extends VehicleFetchEvent {}

class VehicleDeleteEvent extends VehicleDataFetchEvent {
  String id;
  VehicleDeleteEvent({
    required this.id
  });
}
