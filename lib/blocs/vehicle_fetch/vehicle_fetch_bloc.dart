import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';

part 'vehicle_fetch_event.dart';
part 'vehicle_fetch_state.dart';

class VehicleFetchBloc extends Bloc<VehicleFetchEvent, VehicleFetchState> {
  VehicleFetchBloc() : super(VehicleFetchInitial()) {
    on<VehicleDataFetchEvent>(vehicleDataFetchEvent);
  }

  FutureOr<void> vehicleDataFetchEvent(
      VehicleDataFetchEvent event, Emitter<VehicleFetchState> emit) async {
    emit(VehileDataLoading());
    final response = await ApiServiceHost.instance.vehicleDataFetching();
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final verifiedVehicles = vehicleFetchModalFromJson(data);
      print(verifiedVehicles);
      emit(VehileDataSuccsess(verifiedVehicles: verifiedVehicles));
    } else {
      emit(VehileDataFailled());
    }
  }
}
