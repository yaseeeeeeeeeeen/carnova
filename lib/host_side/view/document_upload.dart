import 'dart:io';

import 'package:advance_animated_progress_indicator/advance_animated_progress_indicator.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/host_side/resources/components/custom_button.dart';
import 'package:second_project/host_side/resources/components/custom_navbar.dart';
import 'package:second_project/host_side/utils/image_picker.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';

// ignore: must_be_immutable
class DocumetUpload extends StatelessWidget {
  DocumetUpload({super.key});

  File? selectImage;

  String? selectImagePath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image.bg2), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Upload Document",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 20),
                    ),
                    DottedBorder(
                      padding: const EdgeInsets.all(10),
                      dashPattern: const [8, 4],
                      borderType: BorderType.RRect,
                      strokeWidth: 2,
                      color: Colors.black,
                      radius: const Radius.circular(20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GestureDetector(
                            onTap: () async {
                              final pickedimage = await ImagePickService()
                                  .pickCropImage(
                                      cropAspectRatio: const CropAspectRatio(
                                          ratioX: 16, ratioY: 9),
                                      imageSource: ImageSource.gallery);
                              if (pickedimage != null) {}
                            },
                            child: Stack(
                              children: [
                                Container(
                                    color: Colors.grey,
                                    height:
                                        MediaQuery.sizeOf(context).height / 4.5,
                                    width: MediaQuery.sizeOf(context).width,
                                    child: selectImagePath != null
                                        ? Image(
                                            image: FileImage(
                                                File(selectImagePath!)))
                                        : Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const SizedBox(),
                                                const Icon(
                                                    Icons.file_upload_outlined,
                                                    color: Colors.black,
                                                    size: 80),
                                                Text(
                                                  'Browse to upload',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                          )),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: InkWell(
                                    onTap: () {
                                      // selectImagePath = null;
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    //space for progress indicator
                    Container(
                      width: 320,
                      height: 100,
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: AnimatedLinearProgressIndicator(
                        indicatorColor: Colors.green,
                        indicatorBackgroundColor: Colors.black,
                        labelStyle: GoogleFonts.poppins(color: Colors.black),
                        percentageTextStyle:
                            const TextStyle(color: Colors.black),
                        percentage: selectImagePath == null ? 0 : 1,
                        animationDuration: const Duration(
                          seconds: 1,
                        ),
                        label: 'Document',
                      ),
                    ),
                    MyButton(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CoustomNavBar()));
                        },
                        title: 'SUBMIT'),
                    const SizedBox()
                  ],
                ),
              ),
            )));
  }
}
