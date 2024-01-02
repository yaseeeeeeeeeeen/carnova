import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/font_styles.dart';

// ignore: must_be_immutable
class ProfileScreenListtile extends StatelessWidget {
  ProfileScreenListtile(
      {super.key, required this.text, required this.isLogout});
  final String text;
  bool isLogout = false;
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    return SizedBox(
        height: heigth / 18,
        width: double.infinity,
        child: ListTile(
          title: Text(text,
              style: isLogout
                  ? CustomFontStyles.logoutbutton
                  : CustomFontStyles.listtilesText),
        ));
  }
}
