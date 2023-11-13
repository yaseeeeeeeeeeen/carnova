import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_project/user_side/resources/constant/text_styles.dart';
import 'package:second_project/user_side/view/home_screen.dart';

class MostRatedWid extends StatelessWidget {
  const MostRatedWid({super.key});

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
        width: width / 1.5 - 10,
        height: heigth / 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(imageU.carDemo),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "BMW E30",
                  style: style3,
                ),
                const SizedBox(),
                Text("₹3278", style: style4)
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
              height: 30,
              width: 50,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.yellow,
                  ),
                  //rating
                  Text("4.8",
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
            ),
          ),
        ]));
  }
}
