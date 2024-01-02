import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/resources/constants/font_styles.dart';

class EmptyListLottie extends StatelessWidget {
  EmptyListLottie({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      width: double.maxFinite / 1.5,
      child: Column(
        children: [
          Lottie.asset("assets/Lotties/listEmpty.json"),
          Text(text, style: CustomFontStyles.style1)
        ],
      ),
    ));
  }
}
