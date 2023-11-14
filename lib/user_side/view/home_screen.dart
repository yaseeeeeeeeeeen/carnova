import 'package:flutter/material.dart';
import 'package:second_project/user_side/modals/vehicle_data._modal.dart';
import 'package:second_project/user_side/resources/components/active_vehicle.dart';
import 'package:second_project/user_side/resources/components/map_tap.dart';
import 'package:second_project/user_side/resources/components/most_rated_wid.dart';
import 'package:second_project/user_side/resources/components/title_text_wid.dart';
import 'package:second_project/user_side/resources/constant/imagepath_user.dart';
import 'package:second_project/user_side/utils/appbar.dart';
import 'package:second_project/user_side/view/car_details_screen.dart';

UserSideImages imageU = UserSideImages();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    // double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: customAppBarU(context),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTitles(titles: "Currently"),
                const ActivatedVehicle(),
                HomeTitles(titles: "Choose Location"),
                const MapTapWid(),
                HomeTitles(titles: "Most Rated"),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  height: heigth / 5.9,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarDataShow(vehicleData: vehiclesData[0]))),
                            child: MostRatedDemo(vehicledata: vehiclesData[0]));
                        } else {
                          return const MostRatedWid();
                        }
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 5),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal),
                ),
                SizedBox(height: 70)
              ],
            ),
          ),
        ));
  }
}
