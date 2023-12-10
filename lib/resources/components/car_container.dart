import 'package:flutter/material.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';

import 'package:second_project/resources/constants/text_styles.dart';

class TrendigContainer extends StatelessWidget {
  TrendigContainer({super.key, required this.data});
  VehicleFetchModal data;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
        width: width,
        height: height / 5.6,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: width / 2.3,
                      height: height / 6.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${HostUrl.baseUrl}/${data.images[0]}}"),
                              fit: BoxFit.fill))))),
          Container(
              padding: const EdgeInsets.only(right: 5),
              width: width / 2.3,
              height: 130,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PopinsTextWidget(
                        isBold: false,
                        text: '${data.name} (${data.model.toString()})',
                        size: 17,
                        color: Colors.black,
                        left: 4,
                        top: 2),
                    PopinsTextWidget(
                        isBold: true,
                        text: '\$${data.price.toString()}',
                        size: 18,
                        color: Colors.red,
                        left: 4,
                        top: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopinsTextWidget(
                            isBold: false,
                            text: data.fuel,
                            size: 14,
                            color: Colors.black,
                            left: 4,
                            top: 2),
                        PopinsTextWidget(
                            isBold: false,
                            text: data.transmission,
                            size: 14,
                            color: Colors.black,
                            left: 4,
                            top: 2),
                      ],
                    ),
                    Text(
                      data.location,
                      overflow: TextOverflow.ellipsis,
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     HindTextWidget(
                    //         isBold: false,
                    //         text: 'Booking: 10',
                    //         size: 14,
                    //         color: Colors.black,
                    //         left: 4,
                    //         top: 5),
                    //     HindTextWidget(
                    //         isBold: false,
                    //         text: 'Amount : 10000',
                    //         size: 14,
                    //         color: Colors.black,
                    //         left: 4,
                    //         top: 5)
                    //   ],
                    // )
                  ]))
        ]));
  }
}
