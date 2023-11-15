import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/user_side/modals/vehicle_data._modal.dart';
import 'package:second_project/user_side/resources/components/title_text_wid.dart';
import 'package:second_project/user_side/resources/constant/colors_userside.dart';
import 'package:second_project/user_side/resources/constant/text_styles.dart';
import 'package:second_project/user_side/utils/appbar.dart';

// ignore: must_be_immutable
class CarDataShow extends StatelessWidget {
  CarDataShow({super.key, required this.vehicleData});
  VehicleDataModal vehicleData;
  @override
  Widget build(BuildContext context) {
    List<IconData> icondata = [
      Icons.directions_car_filled_rounded,
      Icons.speed,
      Icons.games_sharp
    ];
    List<String> cardetails = [
      vehicleData.brand,
      vehicleData.fuel,
      vehicleData.transmission
    ];
    double heigth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: cardataBottom(vehicleData.price),
      appBar: customAppBarText(vehicleData.name, context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: vehicleData.name,
                child: Container(
                    height: heigth / 3.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(vehicleData.images[0]),
                            fit: BoxFit.cover)))),
            const SizedBox(height: 5),
            HomeTitles(titles: "Car Details"),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(2),
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icondata[index], size: 50, color: Colors.black),
                      const SizedBox(height: 5),
                      Text(cardetails[index], style: style5)
                    ],
                  ),
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
              ),
            ),
            HomeTitles(titles: "More Images"),
            CarouselSlider(
              options: CarouselOptions(height: heigth / 5, autoPlay: true),
              items: vehicleData.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(i), fit: BoxFit.cover)));
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget cardataBottom(String price) {
  return BottomAppBar(
      child: Container(
    height: 80,
    color: appbarColorU.withOpacity(0.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("₹$price", style: style2),
                Text("  Per Day",
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: Colors.black54))
              ]),
        ),
        const SizedBox(width: 30),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(130, 50),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text("Book Now", style: style4))
      ],
    ),
  ));
}

Widget buildIndicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 6),
    height: 8,
    width: isActive ? 20 : 8,
    decoration: BoxDecoration(
      color: isActive ? Colors.black : Colors.grey[400],
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  );
}
