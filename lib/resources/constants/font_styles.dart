import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      fontSize: 17
      ,
      fontWeight: FontWeight.w600);
}
