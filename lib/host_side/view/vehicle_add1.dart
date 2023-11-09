import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/host_side/resources/components/custom_textfield2.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';
import 'package:second_project/host_side/view/vehicle_add2.dart';

// ignore: must_be_immutable
class AddVehicle extends StatelessWidget {
  AddVehicle({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appbarColor,
          title: Text(
            'Add Vehicle Details',
            style: GoogleFonts.poppins(),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextfield(
                    hint: 'Name',
                    isSufix: false,
                    controller: _nameController),
                CustomTextfield(
                    hint: 'Brand',
                    isSufix: false,
                    controller: _brandController),
                CustomTextfield(
                    hint: 'Modal',
                    isSufix: false,
                    controller: _modalController),
                CustomTextfield(
                    hint: 'Vehicle Number',
                    isSufix: false,
                    controller: _numberController),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddVehicle2()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(width, 50),
                  ),
                  child: Text('NEXT',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
