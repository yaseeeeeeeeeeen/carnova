import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:second_project/modals/dashboard_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';

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
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final data = latesOrders[index];
          DateTime parsedDate = DateTime.parse(data.startDate);
          String formattedDate = DateFormat('MMMM d, y').format(parsedDate);

          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor)),
            height: heigth / 7.3,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${HostUrl.baseUrl}/${data.vehicleDetails.images[0]}"),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    width: width / 2.4,
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
                                    child: Text(data.vehicleDetails.name,
                                        style: CustomFontStyles.tabcardtext1,
                                        overflow: TextOverflow.ellipsis)),
                                Text("₹${data.grandTotal}",
                                    style: CustomFontStyles.tabcardtext1)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formattedDate,
                                    style: CustomFontStyles.tileDateText),
                                Text("(${data.status})",
                                    style: CustomFontStyles.tileStatusText)
                              ],
                            ),
                            Text(
                              "USER : ${data.userDetails.name.toUpperCase()}",
                              style: GoogleFonts.outfit(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ]))
                ]),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: latesOrders.length);
  }
}
