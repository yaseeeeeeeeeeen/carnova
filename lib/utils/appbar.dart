import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';

PreferredSizeWidget customAppBarH(
  String title,
) {
  return AppBar(
      backgroundColor: appbarColorH,
      centerTitle: true,
      elevation: 0,
      title: Text(title, style: CustomFontStyles.normalOutfit));
}

PreferredSizeWidget carDetailsScreen(
  void Function()? onPressed,
  void Function()? delete,
) {
  return AppBar(
      actions: [
        IconButton(
            onPressed: onPressed, icon: Icon(Icons.edit, color: mainColorH)),
        IconButton(onPressed: delete, icon: Icon(Icons.delete, color: red))
      ],
      backgroundColor: appbarColorH,
      centerTitle: true,
      elevation: 0,
      title: Text("CAR DETAILS", style: CustomFontStyles.normalOutfit));
}
