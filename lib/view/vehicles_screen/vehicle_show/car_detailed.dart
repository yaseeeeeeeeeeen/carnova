import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/components/text_widgets/sub_title.dart';
import 'package:second_project/resources/components/vehicle/car_details_card.dart';
import 'package:second_project/resources/components/vehicle/vehicle_image_wid.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/utils/custom_navbar.dart';
import 'package:second_project/utils/snackbar.dart';
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
      vehicleData.seat.toString(),
      ""
      // vehicleData.rating.abs().toString()
    ];
    double heigth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: scaffoldBg,
      // bottomNavigationBar: CarDataBottomBar(price: vehicleData.price.toString()),
      appBar: carDetailsScreen(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddVehicle(vehilcledata: vehicleData)));
      }, () {
        deleteBottomSheet(context, vehicleData.id);
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
              HomeTitles(titles: "Location"),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  tileColor: mainColorH,
                  title: Text(
                    vehicleData.location,
                    style: CustomFontStyles.style5,
                  ),
                ),
              ),
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
                        const SizedBox(height: 10),
                        Text(
                          "Are You Sure...?",
                          style: GoogleFonts.outfit(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
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
