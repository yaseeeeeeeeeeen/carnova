import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resources/constants/colors.dart';

class CustomFontStyles {
  static TextStyle style1 = GoogleFonts.outfit(
      fontSize: 23, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle logoutbutton = GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red);
  static TextStyle listtilesText =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w400);

  /////profile card texts
  static TextStyle profileName = GoogleFonts.outfit(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle mailstyle = GoogleFonts.outfit(
      color: Colors.black.withOpacity(0.7),
      fontSize: 17,
      fontWeight: FontWeight.w600);

  /////////////VEhicle screen/////////////
  static TextStyle tabcardtext1 = GoogleFonts.outfit(
      color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500);
  static TextStyle ratingtitle = GoogleFonts.poppins(
      color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400);

  static TextStyle style7 = GoogleFonts.poppins(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800);
  static TextStyle style5 = GoogleFonts.poppins(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle changePasswordFont = GoogleFonts.poppins(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
  /////////////////////////Home Screen///////////////////////////////////////////////
  static TextStyle tileStatusText = GoogleFonts.outfit(
      fontSize: 13, fontWeight: FontWeight.w500, color: statusColor);
  static TextStyle tileDateText =
      GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w500);
}
