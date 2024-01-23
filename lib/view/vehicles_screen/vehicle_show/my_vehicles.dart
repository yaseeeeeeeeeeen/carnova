import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/empty_list_lottie.dart';
import 'package:second_project/resources/components/vehicle/car_tile.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_show/car_detailed.dart';

// ignore: must_be_immutable
class MyvehiclesList extends StatelessWidget {
  MyvehiclesList({super.key});
  List<VehicleFetchModal> verifiedList = [];
  @override
  Widget build(BuildContext context) {
    context.read<VehicleFetchBloc>().add(VehicleDataFetchEvent());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<VehicleFetchBloc, VehicleFetchState>(
        listener: (context, state) {
          if (state is VehileDataSuccsess) {
            verifiedList = state.verifiedVehicles;
          } else if (state is VehileDataFailled) {
            topSnackbar(context, state.message, Colors.red, false);
          } else if (state is VehicleListEmptyState) {
            // topSnackbar(context, "Vehicle List Empty", Colors.black, true);
          }
        },
        builder: (context, state) {
          return state is VehileDataLoading
              ?  Center(
                  child: CircularProgressIndicator(color: black))
              : verifiedList.isNotEmpty
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final data = verifiedList[index];
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => CarDataShow(
                                                  vehicleData: data)));
                                    },
                                    child: CarListTile(data: data));
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: verifiedList.length),
                          const SizedBox(height: 100)
                        ],
                      ),
                    )
                  : Center(child: EmptyListLottie(text: "LIST IS EMPTY"));
        },
      ),
    );
  }
}
