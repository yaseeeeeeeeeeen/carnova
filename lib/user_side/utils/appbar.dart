import 'package:flutter/material.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';
import 'package:second_project/user_side/resources/constant/colors_userside.dart';
import 'package:second_project/user_side/utils/bottom_nav_bar.dart';
import 'package:second_project/user_side/view/home_screen.dart';

PreferredSizeWidget customAppBarU(context) {
  return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => ScreenParantU(index: 3)),
                (route) => false);
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(imageU.userPhoto),
            backgroundColor: Colors.black,
          ),
        ),
        const SizedBox(width: 10),
      ],
      backgroundColor: appbarColorU,
      elevation: 0,
      title: SizedBox(
          width: 150,
          child: Image(image: AssetImage(image.appLogo), fit: BoxFit.cover)));
}
