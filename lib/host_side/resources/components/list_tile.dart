import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  bool isLogout;
  void Function()? navigation = () {};
  ListTileWidget(
      {super.key,
      required this.title,
      required this.icon,
      this.navigation,
      required this.isLogout});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        height: height / 16,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          onTap: navigation,
          leading: Icon(icon),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: isLogout
                    ? const
                     Color.fromARGB(255, 230, 11, 0)
                    : Colors.black),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
