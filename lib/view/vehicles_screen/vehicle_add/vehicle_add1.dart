import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/blocs/vehicle_add/vehicle_add_bloc.dart';
import 'package:second_project/modals/location_modal.dart';
import 'package:second_project/modals/vehicle_add_modal.dart';
import 'package:second_project/resources/components/custom_textfield2.dart';
import 'package:second_project/resources/components/drop_down.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/vehicle_add2.dart';

// ignore: must_be_immutable
class AddVehicle extends StatelessWidget {
  AddVehicle({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _seatController = TextEditingController();

  bool isloading = false;
  // final GlobalKey<FormState> addvehicle1 = GlobalKey<FormState>();
  num? latitude;
  num? logitude;
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
              DropDownWid(
                  listIndex: 3,
                  controller: _brandController,
                  titletext: "Car Brand",
                  hinttext: "Select Your Vehicle Brand"),
              CustomTextfield(
                  hint: 'Modal',
                  isSufix: false,
                  controller: _modalController,
                  keybordtype: TextInputType.number),
              DropDownWid(
                  listIndex: 2,
                  controller: _seatController,
                  titletext: "Seat Capacity",
                  hinttext: "Choose One"),
              CustomTextfield(
                  hint: 'Vehicle Number',
                  isSufix: false,
                  controller: _numberController),
              BlocConsumer<VehicleAddBloc, VehicleAddState>(
                listener: (context, state) {
                  if (state is LoadingState) {
                    isloading = true;
                  } else if (state is LocationPickingSuccsessState) {
                    final locdata = LocationData.fromJson(state.locationdata);
                    _locationController.text = locdata.address;

                    latitude = locdata.latitude;
                    logitude = locdata.longitude;
                    isloading = false;
                  } else if (state is LocationPickingFaildState) {
                    ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                        context, false, "Location Picking Faild, Try Again"));
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height / 12,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextfield(
                              hint: 'Location',
                              isSufix: false,
                              controller: _locationController),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<VehicleAddBloc>()
                                .add(LocationPickerVehilceAddEvent());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(13),
                            margin: const EdgeInsets.only(
                                top: 10, left: 5, right: 5),
                            height: height / 14,
                            width: width / 5,
                            child: Center(
                              child: isloading
                                  ? const CircularProgressIndicator(
                                      color: Colors.black,
                                    )
                                  : SvgPicture.asset(image.locationSvg,
                                      height: height / 24),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
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
        _seatController.text.isNotEmpty &&
        _numberController.text.isNotEmpty &&
        _locationController.text.isNotEmpty) {
      VehicleAddData? vehicleDataobj = VehicleAddData(
        seat: _seatController.text,
        location: _locationController.text,
        longitude: logitude!,
        latitude: latitude!,
        name: _nameController.text,
        brand: _brandController.text,
        model: _modalController.text,
        number: _numberController.text,
      );

      print(vehicleDataobj.seat);
      print(vehicleDataobj.brand);
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
