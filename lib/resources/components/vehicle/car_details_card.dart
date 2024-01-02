import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key, required this.cardetails});
  final List cardetails;
  @override
  Widget build(BuildContext context) {
    List<String> svgPath = [
      "assets/svg/car-steering-wheel-svgrepo-com.svg",
      "assets/svg/fuel-svgrepo-com.svg",
      "assets/svg/gearshift-gear-svgrepo-com.svg",
      "assets/svg/star-svgrepo-com.svg"
    ];
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          if (index == cardetails.length - 1) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white30,
                      height: MediaQuery.sizeOf(context).height / 1.7,
                      // child: SingleChildScrollView(
                      //   physics: const BouncingScrollPhysics(),
                      //   // child: Column(
                      //   //   children: [
                      //   //     Text("Reviews", style: reviweTitle),
                      //   //     const ReviewCommentTile(
                      //   //         review: "its very friendly to use",
                      //   //         rating: "4.5"),
                      //   //     const ReviewCommentTile(
                      //   //         review: "Good coundition", rating: "4.2")
                      //   //   ],
                      //   // ),
                      // ),
                    );
                  },
                );
              },
              child: Container(
                  margin: const EdgeInsets.all(2),
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appbarColorH),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(svgPath[index],
                                fit: BoxFit.cover, height: 30, width: 30),
                            Text(cardetails[index],
                                style: CustomFontStyles.style7)
                          ],
                        ),
                        Text("Rating", style: CustomFontStyles.ratingtitle)
                      ],
                    ),
                  )),
            );
          } else {
            return Container(
              margin: const EdgeInsets.all(2),
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgPath[index],
                      height: 25, width: 25, fit: BoxFit.cover),
                  const SizedBox(height: 5),
                  Text(cardetails[index], style: CustomFontStyles.style5)
                ],
              ),
            );
          }
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cardetails.length,
      ),
    );
  }
}
