import 'package:flutter/material.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';

// ignore: must_be_immutable
class CarListTile extends StatelessWidget {
  CarListTile({super.key, required this.data});
  VehicleFetchModal data;
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: mainColorH,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor)),
      height: heigth / 7.3,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Hero(
          tag: data.name,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${HostUrl.imagegettingUrl}${data.images[0]}"),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            width: width / 2.4,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(right: 10),
            width: width / 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(data.name,
                              style: CustomFontStyles.tabcardtext1,
                              overflow: TextOverflow.ellipsis)),
                      Text("₹${data.price}",
                          style: CustomFontStyles.tabcardtext1)
                    ],
                  ),
                  Text("${data.brand.toUpperCase()} (${data.model})",
                      style:
                           TextStyle(color: black87, fontSize: 13)),
                  Text(data.location,
                      style:
                           TextStyle(color: black87, fontSize: 13)),
                ]))
      ]),
    );
  }
}
