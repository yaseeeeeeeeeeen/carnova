import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';

PreferredSizeWidget customAppBar(
  String title,
) {
  return AppBar(
      backgroundColor: appbarColor,
      centerTitle: true,
      elevation: 0,
      title: Text('$title', style: GoogleFonts.poppins()));
}
