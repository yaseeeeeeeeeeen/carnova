import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:second_project/resources/constants/lottie_path.dart';
import 'package:second_project/utils/appbar.dart';

class AccountUnderverificationScreen extends StatelessWidget {
  const AccountUnderverificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: customAppBarH("UNDER VERIFICATION"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Container(
            child: Lottie.asset(LottiesAsset.accountUnderverification,
                height: h / 4, fit: BoxFit.cover, width: w / 1.3),
          ),
          const SizedBox(height: 30),
          SizedBox(
            child: Align(
              alignment: Alignment.center,
              child: Text("YOUR ACCOUNT UNDER\nVERIFICATION",
                  textAlign: TextAlign.center, style: CustomFontStyles.style1),
            ),
          ),
        ],
      ),
    );
  }
}
