import 'package:flutter/material.dart';
import 'package:second_project/modals/dashboard_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/constants/font_styles.dart';

class TrendingWid extends StatelessWidget {
  TrendingWid({super.key, required this.data});
  Trending data;
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      height: heigth / 7.3,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Hero(
          tag: data.vehicle.name,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${HostUrl.baseUrl}/${data.vehicle.images[0]}"),
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
                          child: Text(data.vehicle.name,
                              style: CustomFontStyles.tabcardtext1,
                              overflow: TextOverflow.ellipsis)),
                      Text("₹${data.vehicle.price}",
                          style: CustomFontStyles.tabcardtext1)
                    ],
                  ),
                  Text("${data.vehicle.brand.toUpperCase()} (${data.vehicle.model})",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 13)),
                  Text(data.vehicle.location,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 13)),
                ]))
      ]),
    );
  }
}
