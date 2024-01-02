

import 'package:get_it/get_it.dart';
import 'package:second_project/blocs/login/login_bloc_bloc.dart';
import 'package:second_project/modals/host_data_modal.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginBloc());
}

HostModel getLoggedInHost() {
  return locator<LoginBloc>().hostModelData;
}

void replaceUserData(HostModel updatedUserData) {
  locator<LoginBloc>().hostModelData = updatedUserData;
}
