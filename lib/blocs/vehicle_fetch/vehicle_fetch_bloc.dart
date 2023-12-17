import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/repositories/vehicle_fetch_repo.dart';

part 'vehicle_fetch_event.dart';
part 'vehicle_fetch_state.dart';

class VehicleFetchBloc extends Bloc<VehicleFetchEvent, VehicleFetchState> {
  VehicleFetchBloc() : super(VehicleFetchInitial()) {
    on<VehicleDataFetchEvent>(vehicleDataFetchEvent);
  }

  FutureOr<void> vehicleDataFetchEvent(
      VehicleDataFetchEvent event, Emitter<VehicleFetchState> emit) async {
    emit(VehileDataLoading());
    final response = await VehicleDataFetchRepo().vehicleDataFetch();
    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      final verifiedVehicles = vehicleFetchModalFromJson(response.body);
      print(verifiedVehicles[0].name);
      emit(VehileDataSuccsess(verifiedVehicles: verifiedVehicles));
    } else {
      emit(VehileDataFailled());
    }
  }
}
