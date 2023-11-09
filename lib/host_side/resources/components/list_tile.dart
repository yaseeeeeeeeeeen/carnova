import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ListTileWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      height: height / 16,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
