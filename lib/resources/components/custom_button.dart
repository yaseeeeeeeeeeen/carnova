import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resources/constants/colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  const MyButton({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: buttonColorsH,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}

class MyLoadingButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final bool isLoading;
  const MyLoadingButton(
      {super.key, this.onTap, required this.title, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 52,
        padding: const EdgeInsets.only(left: 20, right: 20),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: buttonColorsH,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(color: Colors.white))
              : Text(title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  )),
        ),
      ),
    );
  }
}
