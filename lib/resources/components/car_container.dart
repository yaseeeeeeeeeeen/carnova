import 'package:flutter/material.dart';

import 'package:second_project/resources/constants/text_styles.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';

class TrendigContainer extends StatelessWidget {
  const TrendigContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
        width: width,
        height: height / 5.4,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
              padding: const EdgeInsets.only(left: 9),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: width / 2.5,
                      height:height / 6.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(image.car2),
                              fit: BoxFit.fill))))),
          Container(
              width: width / 2,
              height: 130,
              color: Colors.white,
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PopinsTextWidget(
                        isBold: false,
                        text: 'Datsun',
                        size: 16,
                        color: Colors.black,
                        left: 4,
                        top: 2),
                    PopinsTextWidget(
                        isBold: true,
                        text: '\$200.00',
                        size: 18,
                        color: Colors.red,
                        left: 4,
                        top: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SvgPicture.asset(
                        //   'lib/image/transmission.svg',
                        //   height: 40,
                        //   width: 40,
                        // ),
                        PopinsTextWidget(
                            isBold: false,
                            text: 'Petrol',
                            size: 14,
                            color: Colors.black,
                            left: 4,
                            top: 2),
                        // SvgPicture.asset(
                        //   'lib/image/transmission.svg',
                        //   height: 40,
                        //   width: 40,
                        // ),
                        PopinsTextWidget(
                            isBold: false,
                            text: 'Automatic',
                            size: 14,
                            color: Colors.black,
                            left: 4,
                            top: 2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HindTextWidget(
                            isBold: false,
                            text: 'Booking: 10',
                            size: 14,
                            color: Colors.black,
                            left: 4,
                            top: 5),
                        HindTextWidget(
                            isBold: false,
                            text: 'Amount : 10000',
                            size: 14,
                            color: Colors.black,
                            left: 4,
                            top: 5)
                      ],
                    )
                  ]))
        ]));
  }
}
