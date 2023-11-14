import 'dart:math';

import 'package:flutter/material.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';
import 'package:second_project/user_side/resources/components/profile_tile_button.dart';
import 'package:second_project/user_side/resources/constant/colors_userside.dart';
import 'package:second_project/user_side/resources/constant/text_styles.dart';
import 'package:second_project/user_side/view/home_screen.dart';

PreferredSizeWidget customAppBarU(context) {
  double height = MediaQuery.sizeOf(context).height;
  return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return bottomsheetWid(height, context);
              },
            );
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

Widget bottomsheetWid(double height, context) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: height / 1.6,
    child: Column(children: [
      Container(
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageU.profileBg), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1),
            color: Colors.white,
          ),
          height: height / 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 47,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                    backgroundImage: AssetImage(imageU.userPhoto),
                    radius: 45,
                    backgroundColor: Colors.black),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 1.5,
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Muhammed Yaseen",
                          style: style5, overflow: TextOverflow.ellipsis),
                      Text("muahhammedyasDDDDDDDDDDDDDDDDDDeen@gmail.com",
                          overflow: TextOverflow.ellipsis, style: style6),
                    ]),
              )
            ],
          )),
      ListTileToggle(text: "Dark Mode"),
      ListTilePwid(
          title: "Change Password",
          icon: const Icon(Icons.lock_clock_outlined, color: Colors.black)),
      ListTilePwid(
          title: "Clear data",
          icon: const Icon(Icons.delete_forever_outlined, color: Colors.black)),
      ListTilePwid(
          title: "Help",
          icon: const Icon(Icons.help_center_outlined, color: Colors.black)),
      ListTilePwid(
          title: "About",
          icon: const Icon(Icons.info_outline_rounded, color: Colors.black)),
    ]),
  );
}
