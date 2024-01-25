import 'package:flutter/material.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/empty_list_lottie.dart';
import 'package:second_project/resources/components/vehicle/car_tile.dart';
import 'package:second_project/view/vehicles_screen/vehicle_show/car_detailed.dart';

// ignore: must_be_immutable
class PendigVerification extends StatelessWidget {
  PendigVerification({super.key});
  List<VehicleFetchModal> pendingList = getPendingVehicles();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:pendingList.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = pendingList[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CarDataShow(vehicleData: data)));
                          },
                          child: CarListTile(data: data));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: pendingList.length)
                : Center(child: EmptyListLottie(text: "LIST IS EMPTY")),
      ),
    );
  }
}
