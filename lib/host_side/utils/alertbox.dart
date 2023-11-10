import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/host_side/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';

signoutConfirmation(context) {
  TextStyle logoutbuttonstyle = GoogleFonts.poppins(
      color: CupertinoColors.destructiveRed,
      fontWeight: FontWeight.w500,
      fontSize: 16);
  TextStyle cancleButtonStyle = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16);
  return showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 20),
                child: Text(
                  'Logout your account',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                onPressed: () async {
                  await SharedPreference.instance.removeToken();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                child: Text('Logout', style: logoutbuttonstyle),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: cancleButtonStyle,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
