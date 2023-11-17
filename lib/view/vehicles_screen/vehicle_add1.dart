import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/modals/vehicle_add_modal.dart';
import 'package:second_project/resources/components/custom_textfield2.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add2.dart';

// ignore: must_be_immutable
class AddVehicle extends StatelessWidget {
  AddVehicle({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  // final GlobalKey<FormState> addvehicle1 = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: customAppBarH('Add Vehicle Details'),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextfield(
                  hint: 'Name', isSufix: false, controller: _nameController),
              CustomTextfield(
                  hint: 'Brand', isSufix: false, controller: _brandController),
              CustomTextfield(
                  hint: 'Modal', isSufix: false, controller: _modalController),
              CustomTextfield(
                  hint: 'Vehicle Number',
                  isSufix: false,
                  controller: _numberController),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  nextpage(context);
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
    );
  }

  nextpage(context) {
    if (_brandController.text.isNotEmpty &&
        _modalController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _numberController.text.isNotEmpty) {
          VehicleAddData? vehicleDataobj=VehicleAddData( name: _nameController.text, brand: _brandController.text, modal: _modalController.text, vehicleNumber: _numberController.text,);
     
      print(vehicleDataobj.name);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddVehicle2(
                vehicledatas: vehicleDataobj,
              )));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackbar(context, false, "Add all datas"));
    }
  }
}
