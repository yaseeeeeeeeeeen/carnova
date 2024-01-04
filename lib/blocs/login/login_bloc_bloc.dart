import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/dashboard_modal.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/repositories/host_repo.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  late HostModel hostModelData;
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginClickedEvent>(loginClickedEvent);
    on<HostDetailsFetch>(hostDetailsFetch);
    on<HostDashboardFetchEvent>(hostDashboardFetchEvent);
  }

  FutureOr<void> loginClickedEvent(
      LoginClickedEvent event, Emitter<LoginBlocState> emit) async {
    emit(LoginLoadingState());

    final response = await HostRepo().loginData(event.mailandpass);
    response.fold((error) {
      emit(LoginErrorState(messege: error.message));
    }, (response) {
      final token = response["token"];
      SharedPreference.instance.storeToken(token);
    });
    emit(LoginSuccsessState());
  }

  FutureOr<void> hostDetailsFetch(
      HostDetailsFetch event, Emitter<LoginBlocState> emit) async {
    final token = SharedPreference.instance.getToken();
    if (token != null) {
      final respo = await HostRepo().fetchHostData();
      respo.fold((left) {
        emit(LoginErrorState(messege: left.message));
      }, (right) {
        HostModel host = HostModel.fromJson(right);
        locator<LoginBloc>().hostModelData = host;
        emit(LoginDataFetchState());
      });
    } else {
      emit(LoginFailedState(message: "Login Failed Try Again"));
    }
  }

  FutureOr<void> hostDashboardFetchEvent(
      HostDashboardFetchEvent event, Emitter<LoginBlocState> emit) async {
    final dashboardData = await HostRepo().fetchDashboard();
    dashboardData.fold((left) {
      emit(LoginFailedState(message: left.message));
    }, (right) {
       final dashboardData = DashbordModal.fromJson(right);
       locator<VehicleFetchBloc>().dashboard = dashboardData;
            emit(HostDashbordFetched());
    });
  }
}
