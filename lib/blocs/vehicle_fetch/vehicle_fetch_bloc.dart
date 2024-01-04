import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:second_project/modals/dashboard_modal.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/repositories/host_repo.dart';

part 'vehicle_fetch_event.dart';
part 'vehicle_fetch_state.dart';

class VehicleFetchBloc extends Bloc<VehicleFetchEvent, VehicleFetchState> {
  late DashbordModal dashboard;
  VehicleFetchBloc() : super(VehicleFetchInitial()) {
    on<VehicleDataFetchEvent>(vehicleDataFetchEvent);
    on<VehicleDeleteEvent>(vehicleDeleteEvent);
  }

  FutureOr<void> vehicleDataFetchEvent(
      VehicleDataFetchEvent event, Emitter<VehicleFetchState> emit) async {
    emit(VehileDataLoading());
    final response = await HostRepo().vehicleDataFetching();
    response.fold((left) {
      emit(VehileDataFailled(message: left.message));
    }, (right) {
      if (right.isEmpty) {
        emit(VehicleListEmptyState());
      } else {
        final vehiclelist = right as List;
        final data =
            vehiclelist.map((e) => VehicleFetchModal.fromJson(e)).toList();
        List<VehicleFetchModal> pending =
            data.where((element) => element.isVerified == false).toList();
        List<VehicleFetchModal> verified =
            data.where((element) => element.isVerified == true).toList();
        emit(VehileDataSuccsess(
            verifiedVehicles: verified, pendingVehicles: pending));
      }
    });
  }

  FutureOr<void> vehicleDeleteEvent(
      VehicleDeleteEvent event, Emitter<VehicleFetchState> emit) async {
    final response = await HostRepo().vehicleDelete(event.id);
    response.fold((left) {
      emit(VehicleDeleteFailedState(messege: left.message));
    }, (right) {
      emit(VehicleDeletedState());
    });
  }
}
