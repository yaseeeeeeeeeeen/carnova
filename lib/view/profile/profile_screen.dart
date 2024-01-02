import 'package:flutter/material.dart';
import 'package:second_project/resources/components/profile_components/listiles_pr.dart';
import 'package:second_project/resources/components/profile_components/profile_card.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/utils/logout_confirm.dart';
import 'package:second_project/view/profile/change_password.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: customAppBarH("PROFILE"),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfileCardWid(),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen()));
                  },
                  child: ProfileScreenListtile(
                    text: "Change Password",
                    isLogout: false,
                  ),
                ),
                ProfileScreenListtile(text: "App info", isLogout: false),
                ProfileScreenListtile(
                    text: "Terms & Conditions", isLogout: false),
                ProfileScreenListtile(
                    text: "Privacy & Policy", isLogout: false),
                ProfileScreenListtile(text: "Help", isLogout: false),
                const Divider(thickness: 1.5),
                ProfileScreenListtile(text: "Clear App Data", isLogout: false),
                GestureDetector(
                    onTap: () {
                      signoutConfirmation(context);
                    },
                    child: ProfileScreenListtile(
                        text: "Sign Out", isLogout: true)),
              ],
            ),
          ),
        ));
  }
}
