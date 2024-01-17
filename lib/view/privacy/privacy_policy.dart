import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/policies/privacy_and_policy_data.dart';
import 'package:second_project/utils/appbar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: customAppBarH("Privacy Policy"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: PrivacyAndPolicyData.textContent.length,
          itemBuilder: (context, index) {
            final data = PrivacyAndPolicyData.textContent[index];

            return Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(10),
                  color: mainColorH),
              child: ListTile(
                // leading: Text("${index + 1}"),
                title: Text(data),
              ),
            );
          },
        ),
      ),
    );
  }
}
