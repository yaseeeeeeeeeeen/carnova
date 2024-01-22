import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_project/modals/dashboard_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:shimmer/shimmer.dart';

class LatestOrderWid extends StatelessWidget {
  LatestOrderWid({super.key, required this.latesOrders});
  List<LatestOrder> latesOrders;
  int length = 0;
  @override
  Widget build(BuildContext context) {
    if (latesOrders.length > 3) {
      length = 3;
    } else {
      length = latesOrders.length;
    }
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final data = latesOrders[index];

          return MostRatedDemo(vehicledata: data);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: latesOrders.length);
  }
}

// ignore: must_be_immutable
class MostRatedDemo extends StatelessWidget {
  MostRatedDemo({super.key, required this.vehicledata});
  // VehicleDataModal vehicledata;
  LatestOrder vehicledata;
  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(vehicledata.startDate);
    String formattedDate = DateFormat('MMMM d, y').format(parsedDate);
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: GestureDetector(
          child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: CachedNetworkImage(
              width: width / 1.5 - 10,
              height: heigth / 6,
              fit: BoxFit.cover,
              imageUrl:
                  "${HostUrl.imagegettingUrl}${vehicledata.vehicleDetails.images[0]}",
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: shimmerbaseColor,
                highlightColor: shimmerhighlightColor,
                child: Container(
                  width: width / 1.5 - 10,
                  height: heigth / 6,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              url),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          Container(
              color: mainColorH,
              width: width / 1.5 - 10,
              height: heigth / 16,
              padding: const EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(vehicledata.vehicleDetails.name,
                            style: CustomFontStyles.tileDateText),
                        Text("₹${vehicledata.grandTotal}",
                            style: CustomFontStyles.tileDateText),
                      ],
                    ),
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formattedDate,
                          style: CustomFontStyles.tileDateText,
                        ),
                        vehicledata.status == "Booked"
                            ? Text(
                                vehicledata.status,
                                style: CustomFontStyles.tileStatusText,
                              )
                            : Text(
                                vehicledata.status,
                                style: CustomFontStyles.tileStatusTextRed,
                              ),
                      ],
                    ))
                  ]))
        ],
      )),
    );
  }
}
