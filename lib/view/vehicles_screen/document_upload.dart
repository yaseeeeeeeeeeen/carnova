import 'dart:io';

import 'package:advance_animated_progress_indicator/advance_animated_progress_indicator.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/blocs/document_upload/document_upload_bloc.dart';
import 'package:second_project/modals/vehicle_add_modal.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/utils/custom_navbar.dart';
import 'package:second_project/utils/notice_box.dart';
import 'package:second_project/utils/snackbar.dart';

// ignore: must_be_immutable
class DocumetUpload extends StatelessWidget {
  DocumetUpload(
      {super.key, required this.vehicledatas, required this.selecedImages});
  VehicleAddData vehicledatas;
  List<File> selecedImages;
  bool imageSelected = false;

  File? selectImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBarH("Upload Vehicle Document"),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
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
                        context
                            .read<DocumentUploadBloc>()
                            .add(DocumentUploadClicked(imageUploaded: true));
                      },
                      child: Stack(
                        children: [
                          BlocConsumer<DocumentUploadBloc, DocumentUploadState>(
                            listener: (context, state) {
                              if (state is DocumentUploadSuccsessState) {
                                selectImagePath = state.imagePath;
                              } else if (state is DocumentUploadFailedState) {
                                customSnackbar(context, false,
                                    "Something Wrong Try Again");
                              } else if (state is DocumentClearedState) {
                                selectImagePath = null;
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                  color: Colors.grey.shade300,
                                  height:
                                      MediaQuery.sizeOf(context).height / 4.5,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: selectImagePath != null
                                      ? Image(
                                          image: FileImage(
                                              File(selectImagePath!.path)),
                                          fit: BoxFit.cover)
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
                                        ));
                            },
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: InkWell(
                                  onTap: () {
                                    context
                                        .read<DocumentUploadBloc>()
                                        .add(ImageClearButton());
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
                                      ))))
                        ],
                      ),
                    )),
              ),
              const SizedBox(height: 50),
              BlocBuilder<DocumentUploadBloc, DocumentUploadState>(
                builder: (context, state) {
                  if (state is DocumentUploadSuccsessState) {
                    imageSelected = true;
                  } else if (state is DocumentUploadLoadingState) {
                    imageSelected = true;
                  } else {
                    imageSelected = false;
                  }
                  return Container(
                    width: MediaQuery.sizeOf(context).width - 40,
                    height: MediaQuery.sizeOf(context).height / 10,
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: AnimatedLinearProgressIndicator(
                      indicatorColor: Colors.green,
                      indicatorBackgroundColor: Colors.grey,
                      labelStyle: GoogleFonts.poppins(color: Colors.black),
                      percentageTextStyle: const TextStyle(color: Colors.black),
                      percentage: imageSelected ? 1 : 0,
                      animationDuration: const Duration(
                        seconds: 2,
                      ),
                      label: 'Document',
                    ),
                  );
                },
              ),
              BlocConsumer<DocumentUploadBloc, DocumentUploadState>(
                  listener: (context, state) {
                if (state is DocumentAllSuccsessState) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ScreenParant()),
                      (route) => false);
                  AlertBoxes()
                      .showSuccessDialog(context, 'Vehicle Added successful');
                } else if (state is DocumentUploadFailedState) {
                  customSnackbar(context, false, "Upload Your Vehicle RC");
                } else {
                  customSnackbar(context, false, "Somethin Wrong");
                }
              }, builder: (context, state) {
                bool isLoading = state is DocumentUploadLoadingState;
                return MyLoadingButton(
                    isLoading: isLoading,
                    onTap: () {
                      if (selectImagePath != null) {
                        context.read<DocumentUploadBloc>().add(
                            DocumentSubmitClicked(
                                vehicledata: vehicledatas,
                                vehicleImages: selecedImages,
                                doc: selectImagePath!));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackbar(context, false, "ADD DOCUMENT"));
                      }
                    },
                    title: 'SUBMIT');
              }),
              const SizedBox()
            ],
          ),
        ));
  }
}
