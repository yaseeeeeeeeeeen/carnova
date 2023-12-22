import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/blocs/vehicle_add/vehicle_add_bloc.dart';
import 'package:second_project/modals/vehicle_add_modal.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/resources/components/custom_textfield.dart';
import 'package:second_project/resources/components/custom_textfield2.dart';
import 'package:second_project/resources/components/drop_down.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/document_upload.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';

// ignore: must_be_immutable
class AddVehicle2 extends StatelessWidget {
  AddVehicle2({Key? key, required this.vehicledatas, this.vehicledata})
      : super(key: key);
  VehicleAddData vehicledatas;
  XFile? imageee;
  VehicleFetchModal? vehicledata;

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  List<File> selectedImages = [];
  List<File> updateImages = [];
  @override
  Widget build(BuildContext context) {
    if (vehicledata != null) {
      context
          .read<VehicleAddBloc>()
          .add(VehicleUpdateImages(imageUrls: vehicledata!.images));
      vehicledatanotEmpty(context);
    }
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
                  DropDownWid(
                      listIndex: 0,
                      controller: fuelController,
                      hinttext: 'Select Fuel Type',
                      titletext: "Fuel Type"),
                  DropDownWid(
                      listIndex: 1,
                      controller: transmissionController,
                      hinttext: "Select Transmission Type",
                      titletext: "Transmission"),
                  CustomTextfield(
                      keybordtype: TextInputType.number,
                      hint: 'Price',
                      isSufix: false,
                      controller: _priceController),
                  const SizedBox(height: 10),
                  BlocConsumer<VehicleAddBloc, VehicleAddState>(
                    listener: (context, state) {
                      if (state is ImagePickingSuccsess) {
                        if (vehicledata != null) {
                          updateImages.add(state.pickedImage);
                        }
                        selectedImages.add(state.pickedImage);
                      } else if (state is ImagePickingFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackbar(
                                context, false, "Something Wrong Try Again"));
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<VehicleAddBloc>()
                              .add(ImageAddingButtonClicked());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(image.bg1),
                                  fit: BoxFit.cover),
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
                      );
                    },
                  ),
                  BlocConsumer<VehicleAddBloc, VehicleAddState>(
                    listener: (context, state) {
                      if (state is VehicleUpdateImageSuccsess) {
                        selectedImages = state.images;
                      } else if (state is ImageRemovedSuccsessState) {
                        {
                          selectedImages.removeAt(state.index);
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is ImagesFetchSuccsessState) {
                        return GridView.builder(
                            shrinkWrap: true,
                            itemCount: selectedImages.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, crossAxisSpacing: 1),
                            itemBuilder: (context, index) {
                              {
                                return Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.file(
                                          selectedImages[index],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )),
                                  ),
                                  Center(
                                    child: IconButton(
                                        onPressed: () {
                                          context.read<VehicleAddBloc>().add(
                                              ImageRemoveButtonClicked(
                                                  imageId: vehicledata!
                                                      .images[index],
                                                  vehicleId: vehicledata!.id,
                                                  index: index));
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 40,
                                          color: Colors.red,
                                        )),
                                  )
                                ]);
                              }
                            });
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
              BlocConsumer<VehicleAddBloc, VehicleAddState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ElevetedLoadingBtn(
                      isLoading: false,
                      title: vehicledata != null ? 'UPDATE' : 'NEXT',
                      onPressed: () {
                        if (vehicledata != null) {
                          print("1.1");
                          context.read<VehicleAddBloc>().add(VehicleUpdateEvent(
                              data: vehicledata!,
                              newaddedImages: updateImages,
                              vehicleId: vehicledata!.id));
                        } else {
                          nextpage2(context);
                        }
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  nextpage2(context) {
    print("1.2");
    if (_priceController.text.isNotEmpty &&
        fuelController.text.isNotEmpty &&
        transmissionController.text.isNotEmpty &&
        selectedImages.isNotEmpty) {
      vehicledatas.fuel = fuelController.text;
      vehicledatas.price = double.parse(_priceController.text);
      vehicledatas.transmission = transmissionController.text;

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DocumetUpload(
              imageSelected: false,
              vehicledatas: vehicledatas,
              selecedImages: selectedImages)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackbar(context, false, "Add all datas"));
    }
  }

  vehicledatanotEmpty(context) async {
    _priceController.text = vehicledata!.price.toString();
    fuelController.text = vehicledata!.fuel;
    transmissionController.text = vehicledata!.transmission;
  }
}
