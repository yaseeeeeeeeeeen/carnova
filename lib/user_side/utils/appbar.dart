import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';
import 'package:second_project/user_side/resources/constant/colors_userside.dart';
import 'package:second_project/user_side/utils/profile_sheet.dart';
import 'package:second_project/user_side/view/home_screen.dart';

PreferredSizeWidget customAppBarU(context) {
  double height = MediaQuery.sizeOf(context).height;
  return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
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


PreferredSizeWidget customAppBarText(String title, context) {
  return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.white)),
      backgroundColor: appbarColorU,
      centerTitle: true,
      elevation: 0,
      title: Text(title, style: GoogleFonts.poppins()));
}
