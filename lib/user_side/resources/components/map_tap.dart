import 'package:flutter/material.dart';
import 'package:second_project/user_side/resources/constant/text_styles.dart';
import 'package:second_project/user_side/view/home_screen.dart';

class MapTapWid extends StatelessWidget {
  const MapTapWid({super.key});

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      height: heigth / 7.7,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageU.mapImg),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken)),
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Center(child: Text("Search Nearby", style: style2)),
    );
  }
}
