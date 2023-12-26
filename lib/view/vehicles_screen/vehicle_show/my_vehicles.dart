import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/car_container.dart';
import 'package:second_project/utils/custom_navbar.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/vehicle_add1.dart';

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
            topSnackbar(context, "Vehicle List Empty", Colors.black, true);
          }
        },
        builder: (context, state) {
          return state is VehileDataLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.black))
              : verifiedList.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = verifiedList[index];
                        return GestureDetector(
                            onLongPress: () {
                              deleteBottomSheet(context, data.id);
                            },
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AddVehicle(vehilcledata: data)));
                            },
                            child: TrendigContainer(data: data));
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: verifiedList.length)
                  : const Center(child: Text("DATA IS EMPTY"));
        },
      ),
    );
  }

  deleteBottomSheet(context, String id) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            color: Colors.amber,
            child: BlocConsumer<VehicleFetchBloc, VehicleFetchState>(
              listener: (context, state) {
                if (state is VehicleDeletedState) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ScreenParant(index: 1)),
                      (route) => false);
                } else if (state is VehicleDeleteFailedState) {
                  topSnackbar(context, state.messege,
                      const Color.fromARGB(255, 173, 12, 0), true);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Are You Sure...?"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<VehicleFetchBloc>()
                                      .add(VehicleDeleteEvent(id: id));
                                },
                                child: const Text("OK")),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("CANCEL")),
                          ],
                        )
                      ]),
                );
              },
            ),
          );
        });
  }
}
