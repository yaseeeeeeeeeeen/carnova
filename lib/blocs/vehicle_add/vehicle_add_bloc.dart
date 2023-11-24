import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:second_project/utils/functions/location_picker.dart';

part 'vehicle_add_event.dart';
part 'vehicle_add_state.dart';

class VehicleAddBloc extends Bloc<VehicleAddEvent, VehicleAddState> {
  VehicleAddBloc() : super(VehicleAddInitial()) {
    on<LocationPickerVehilceAddEvent>(locationPickerVehilceAdd);
  }

  FutureOr<void> locationPickerVehilceAdd(
      LocationPickerVehilceAddEvent event, Emitter<VehicleAddState> emit) async {
    emit(LoadingState());
    final locationData = await LocationPickService().getCurrentLocation();
    emit(LocationPickingSuccsessState(locationdata: locationData));
  }
}
