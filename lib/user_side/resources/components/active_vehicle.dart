import 'package:flutter/material.dart';
import 'package:second_project/user_side/modals/vehicle_data._modal.dart';
import 'package:second_project/user_side/resources/components/title_text_wid.dart';
import 'package:second_project/user_side/resources/constant/colors_userside.dart';
import 'package:second_project/user_side/resources/constant/text_styles.dart';
import 'package:second_project/user_side/view/home_screen.dart';

class ActivatedVehicle extends StatelessWidget {
  const ActivatedVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    /// just added in vehicle data list
    final mappp = VehicleDataModal.fromJson(imageU.vehicleData);
    vehiclesData.add(mappp);
    final data = vehiclesData[0];
    ////////////////////////////////////////////////////////////////
    double heigth = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: appbarColorU.withOpacity(0.7),
      ),
      height: heigth / 2.9,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TitleText(title: "ACTIVE"),
              const SizedBox(width: 10),
              const Icon(Icons.circle, color: Colors.green),
              const SizedBox(width: 10)
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: heigth / 4.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(data.coverPhoto), fit: BoxFit.cover)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(data.name, style: style1),
              const SizedBox(),
              PriceText(title: data.price)
            ],
          )
        ],
      ),
    );
  }
}