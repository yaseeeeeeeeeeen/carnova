import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/text_styles.dart';


// ignore: must_be_immutable
class GridviewContainerWidget extends StatelessWidget {
  String value;
  String title;
  GridviewContainerWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2 - 15,
      height: MediaQuery.sizeOf(context).height / 8,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HindTextWidget(
              isBold: true,
              text: value,
              size: 24,
              color: Colors.black,
              left: 15,
              top: 15),
          PopinsTextWidget(
              isBold: false,
              text: title,
              size: 15,
              color: Colors.black.withOpacity(0.7),
              left: 15,
              top: 5)
        ],
      ),
    );
  }
}
