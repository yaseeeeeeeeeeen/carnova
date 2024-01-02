import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/empty_list_lottie.dart';
import 'package:second_project/resources/components/vehicle/car_tile.dart';
import 'package:second_project/utils/custom_navbar.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/vehicle_add1.dart';
import 'package:second_project/view/vehicles_screen/vehicle_show/car_detailed.dart';

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
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CarDataShow(vehicleData: data)));
                            },
                            onDoubleTap: () {
                              //Editttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>
                              //         AddVehicle(vehilcledata: data)));
                            },
                            child: CarListTile(data: data));
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: verifiedList.length)
                  : Center(child: EmptyListLottie(text: "LIST IS EMPTY"));
        },
      ),
    );
  }

  deleteBottomSheet(context, String id) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 110,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Are You Sure...?",
                          style: GoogleFonts.outfit(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    fixedSize: Size(
                                        MediaQuery.sizeOf(context).width / 2.1,
                                        40)),
                                onPressed: () {
                                  context
                                      .read<VehicleFetchBloc>()
                                      .add(VehicleDeleteEvent(id: id));
                                },
                                child: const Text("OK")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    fixedSize: Size(
                                        MediaQuery.sizeOf(context).width / 2.1,
                                        40)),
                                onPressed: () {},
                                child: const Text("CANCEL")),
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
