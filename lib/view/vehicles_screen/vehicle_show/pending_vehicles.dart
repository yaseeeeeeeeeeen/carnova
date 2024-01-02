import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/empty_list_lottie.dart';
import 'package:second_project/resources/components/vehicle/car_tile.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_show/car_detailed.dart';

class PendigVerification extends StatelessWidget {
  PendigVerification({super.key});
  List<VehicleFetchModal> pendingList = [];
  @override
  Widget build(BuildContext context) {
    context.read<VehicleFetchBloc>().add(VehicleDataFetchEvent());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<VehicleFetchBloc, VehicleFetchState>(
          listener: (context, state) {
            if (state is VehileDataSuccsess) {
              pendingList = state.pendingVehicles;
            } else if (state is VehileDataFailled) {
              topSnackbar(context, state.message, Colors.red, false);
            }
          },
          builder: (context, state) {
            return state is VehileDataLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black))
                : pendingList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = pendingList[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CarDataShow(vehicleData: data)));
                              },
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>
                              //         AddVehicle(vehilcledata: data)));

                              child: CarListTile(data: data));
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: pendingList.length)
                    : Center(child: EmptyListLottie(text: "LIST IS EMPTY"));
          },
        ),
      ),
    );
  }
}
