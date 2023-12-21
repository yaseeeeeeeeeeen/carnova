import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownWid extends StatefulWidget {
  DropDownWid(
      {super.key,
      required this.listIndex,
      required this.controller,
      required this.titletext,
      required this.hinttext});
  final int listIndex;
  final String titletext;
  final String hinttext;
  final TextEditingController controller;
  List<dynamic>? mainList;
  @override
  State<DropDownWid> createState() => _DropDownWidState();
}

class _DropDownWidState extends State<DropDownWid> {
  @override
  void initState() {
    //main List of List
    final List<String> fuelList = ['Electric', 'Petrol', 'Disel', 'hybraid'];

    final List<String> transList = [
      'Automatic',
      'Manual',
      'Semi-Auto',
      'Other'
    ];

    final List<String> seats = ['2', '4', '5', '7'];

    final List<String> brand = [
      'Toyota',
      'Volkswagen',
      'Ford',
      'Honda',
      'Chevrolet',
      'Nissan',
      'Mercedes-Benz',
      'BMW',
      'Audi',
      'Hyundai',
      'Kia',
      'Tesla',
      'TATA',
      'Porsche',
      'Jaguar'
    ];

    widget.mainList = [fuelList, transList, seats, brand];
    super.initState();
  }

  final TextStyle _labelStyle =
      GoogleFonts.poppins(fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          widget.titletext,
          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        CustomDropdown(
          selectedStyle: GoogleFonts.poppins(color: Colors.black),
          hintText: widget.hinttext,
          hintStyle: GoogleFonts.poppins(),
          items: widget.mainList?[widget.listIndex],
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          controller: widget.controller,
          excludeSelected: false,
          listItemBuilder: (context, result) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(result, style: _labelStyle),
                const Icon(Icons.circle_outlined)
              ],
            );
          },
        ),
      ],
    );
  }
}
