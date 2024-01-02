import 'package:flutter/material.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/components/text_widgets/sub_title.dart';
import 'package:second_project/resources/components/vehicle/car_details_card.dart';
import 'package:second_project/resources/components/vehicle/vehicle_image_wid.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/vehicle_add1.dart';

// ignore: must_be_immutable
class CarDataShow extends StatelessWidget {
  CarDataShow({super.key, required this.vehicleData});
  VehicleFetchModal vehicleData;
  @override
  Widget build(BuildContext context) {
    List<String> cardetails = [
      vehicleData.brand,
      vehicleData.fuel,
      vehicleData.transmission,
      "4.5"
      // vehicleData.rating.abs().toString()
    ];
    double heigth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: scaffoldBg,
      // bottomNavigationBar: CarDataBottomBar(price: vehicleData.price.toString()),
      appBar: carDetailsScreen(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddVehicle(vehilcledata: vehicleData)));
      }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              HomeTitles(titles: "${vehicleData.name} (${vehicleData.model})"),
              const SizedBox(height: 10),
              Hero(
                  tag: vehicleData.name,
                  child: Container(
                      height: heigth / 3.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${HostUrl.baseUrl}/${vehicleData.images[0]}"),
                              fit: BoxFit.cover)))),
              const SizedBox(height: 5),
              HomeTitles(titles: "Car Details"),
              const SizedBox(height: 10),
              CarDetailsCard(cardetails: cardetails),
              const SizedBox(height: 10),
              // HomeTitles(titles: "Contact"),
              //  CarAgentTile(vehicledata: vehicleData),
              const SizedBox(height: 10),
              HomeTitles(titles: "More Images"),
              const SizedBox(height: 10),
              CarMoreImages(images: vehicleData.images)
            ],
          ),
        ),
      ),
    );
  }
}
