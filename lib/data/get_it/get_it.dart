import 'package:get_it/get_it.dart';
import 'package:second_project/blocs/login/login_bloc_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/dashboard_modal.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => VehicleFetchBloc());
  locator.registerLazySingleton(() => LoginBloc());
}

DashbordModal getDashboard() {
  return locator<VehicleFetchBloc>().dashboard;
}

HostModel getLoggedInHost() {
  return locator<LoginBloc>().hostModelData;
}

List<VehicleFetchModal> getMyVehicles() {
  return locator<VehicleFetchBloc>().verifiedList;
}

void replaceMyVehicles(List<VehicleFetchModal> myVehicles) {
  locator<VehicleFetchBloc>().verifiedList = myVehicles;
}


List<VehicleFetchModal> getPendingVehicles() {
  return locator<VehicleFetchBloc>().pendingList;
}

void replacePendingVehicles(List<VehicleFetchModal> pendingVehicles) {
  locator<VehicleFetchBloc>().pendingList = pendingVehicles;
}
void replaceUserData(HostModel updatedUserData) {
  locator<LoginBloc>().hostModelData = updatedUserData;
}

void replaceDashboardData(DashbordModal updatedDashboard) {
  locator<VehicleFetchBloc>().dashboard = updatedDashboard;
}
