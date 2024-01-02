import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resources/constants/colors.dart';

PreferredSizeWidget customAppBarH(
  String title,
) {
  return AppBar(
      backgroundColor: appbarColorH,
      centerTitle: true,
      elevation: 0,
      title: Text(title, style: GoogleFonts.outfit()));
}

PreferredSizeWidget carDetailsScreen(void Function()? onPressed) {
  return AppBar(
      actions: [
        IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.edit, color: Colors.white))
      ],
      backgroundColor: appbarColorH,
      centerTitle: true,
      elevation: 0,
      title: Text("CAR DETAILS", style: GoogleFonts.outfit()));
}
