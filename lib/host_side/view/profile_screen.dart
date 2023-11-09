import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/host_side/resources/components/list_tile.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';
import 'package:second_project/host_side/resources/constants/text_styles.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: appbarColor,
            centerTitle: true,
            elevation: 0,
            title: Text('PROFILE', style: GoogleFonts.poppins())),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      height: height / 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3)
                                  ,
                                  BlendMode.darken),
                              image: AssetImage(image.appLogo),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 55,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(image.car2),
                            ),
                          ),
                          const PopinsTextWidget(
                              isBold: false,
                              text: 'Yaseen',
                              size: 16,
                              color: Colors.white,
                              left: 0,
                              top: 10)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      ListTileWidget(icon: Icons.person, title: 'My Profile'),
                      ListTileWidget(
                          icon: Icons.lock_person_rounded, title: 'Privacy'),
                      ListTileWidget(
                          icon: Icons.live_help_rounded, title: 'Help & Info'),
                      ListTileWidget(icon: Icons.settings, title: 'Settings')
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
