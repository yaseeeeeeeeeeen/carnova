import 'package:flutter/material.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/resources/components/empty_list_lottie.dart';
import 'package:second_project/resources/components/vehicle/car_tile.dart';
import 'package:second_project/view/vehicles_screen/vehicle_show/car_detailed.dart';

// ignore: must_be_immutable
class MyvehiclesList extends StatelessWidget {
  MyvehiclesList({super.key});
  final verifiedList = getMyVehicles();
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: verifiedList.isNotEmpty
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
              : Center(child: EmptyListLottie(text: "LIST IS EMPTY")),
    );
  }
}
