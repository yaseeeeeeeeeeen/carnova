import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:second_project/resources/constants/policies/policy_dataa.dart';
import 'package:second_project/utils/appbar.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: customAppBarH("Terms and Condition", () {
        Navigator.of(context).pop();
      }),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(10),
                color: mainColorH),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      "CARNOVA",
                      style: CustomFontStyles.style1,
                    ),
                    const Divider(thickness: 2),
                    Text(PrivacyAndPolicyData.termsAndConditionsContentAll,
                        style: CustomFontStyles.policyText,
                        textAlign: TextAlign.left),
                  ],
                )),
          )),
    );
  }
}
