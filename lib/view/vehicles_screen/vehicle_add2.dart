import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';
import 'package:second_project/modals/vehicle_add_modal.dart';
import 'package:second_project/resources/components/custom_textfield.dart';
import 'package:second_project/resources/components/custom_textfield2.dart';
import 'package:second_project/resources/components/drop_down.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/utils/functions/image_picker.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/document_upload.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';

// ignore: must_be_immutable
class AddVehicle2 extends StatelessWidget {
  AddVehicle2({Key? key, required this.vehicledatas}) : super(key: key);
  VehicleAddData vehicledatas;
  XFile? imageee;

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  List<File> selectedImages = [];

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
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  DropDownWid(fuel: true, controller: fuelController),
                  DropDownWid(fuel: false, controller: transmissionController),
                  CustomTextfield(
                      keybordtype: TextInputType.number,
                      hint: 'Price',
                      isSufix: false,
                      controller: _priceController),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      final pickedimage = await ImagePickService()
                          .pickCropImage(
                              cropAspectRatio:
                                  const CropAspectRatio(ratioX: 1, ratioY: 1),
                              imageSource: ImageSource.gallery);
                      if (pickedimage != null) {
                        selectedImages.add(pickedimage as File);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image.bg2), fit: BoxFit.cover),
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10)),
                      height: height / 9,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            size: 35,
                            color: Colors.white,
                          ),
                          TitleTexts(
                              text: 'ADD YOUR VEHICLE IMAGES',
                              size: 19,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: selectedImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, crossAxisSpacing: 1),
                      itemBuilder: (context, index) {
                        {
                          return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.3),
                                          BlendMode.darken),
                                      image: FileImage(
                                          File(selectedImages[index].path)))),
                              margin: const EdgeInsets.all(3),
                              child: Stack(
                                children: [
                                  Center(
                                    child: IconButton(
                                        onPressed: () {
                                          selectedImages.removeAt(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 40,
                                          color: Colors.red,
                                        )),
                                  )
                                ],
                              ));
                        }
                      }),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  nextpage2(context);
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

  nextpage2(context) {
    if (_priceController.text.isNotEmpty &&
            fuelController.text.isNotEmpty &&
            transmissionController.text.isNotEmpty
        // &&
        // selectedImages.isNotEmpty
        ) {
      vehicledatas.fuel = fuelController.text;
      vehicledatas.transmission = transmissionController.text;
      vehicledatas.images = [];
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DocumetUpload(vehicledatas: vehicledatas)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackbar(context, false, "Add all datas"));
    }
  }
}
