import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';

PreferredSizeWidget customAppBarH(String title, Function()? onPressed) {
  return AppBar(
      leading: onPressed != null
          ? IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.arrow_back, color: mainColorH))
          : const SizedBox(),
      backgroundColor: appbarColorH,
      centerTitle: true,
      elevation: 0,
      title: Text(title, style: CustomFontStyles.normalOutfit));
}

PreferredSizeWidget carDetailsScreen(
    void Function()? onPressed, void Function()? delete, BuildContext context) {
  return AppBar(
      // leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: IconButton(
      //         onPressed: onPressed,
      //         icon: Icon(Icons.arrow_back, color: mainColorH))),
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

PreferredSizeWidget customAppBarText(
  String title,
) {
  return AppBar(
      backgroundColor: appbarColorH,
      centerTitle: true,
      elevation: 0,
      title: Text(title, style: CustomFontStyles.normalOutfit));
}
