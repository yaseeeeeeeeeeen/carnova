import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/blocs/profile_edit/profile_edit_bloc.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/resources/components/custom_textfield2.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:second_project/utils/custom_navbar.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';

// ignore: must_be_immutable
class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  File? imagePath;
  bool imageChange = false;
  @override
  Widget build(BuildContext context) {
    imagePath = null;
    final hostModelData = getLoggedInHost();
    nameController.text = hostModelData.name.toString();
    phoneController.text = hostModelData.phone.toString();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                imagePath = null;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => ScreenParant(index: 2)),
                    (route) => false);
              },
              icon: Icon(
                Icons.arrow_back,
                color: mainColorH,
              )),
          backgroundColor: appbarColorH,
          centerTitle: true,
          elevation: 0,
          title: Text("PROFILE EDIT", style: CustomFontStyles.normalOutfit)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            BlocBuilder<ProfileEditBloc, ProfileEditState>(
              builder: (context, state) {
                if (state is ProfileImageAddedState) {
                  imageChange = true;
                  imagePath = state.imagePath;
                }
                return GestureDetector(
                  onTap: () {
                    context.read<ProfileEditBloc>().add(ImageAddedClicked());
                  },
                  child: Hero(
                      tag: "profilePhoto",
                      child: CircleAvatar(
                          radius: 85,
                          backgroundColor: appbarColorH,
                          child: imagePath != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      FileImage(File(imagePath!.path)),
                                  radius: 80,
                                )
                              : hostModelData.profile.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                          '${HostUrl.imagegettingUrl}${hostModelData.profile}'),
                                    )
                                  : CircleAvatar(
                                      radius: 80,
                                      backgroundImage: AssetImage(
                                        image.profilePhotodemo,
                                      ),
                                    ))),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomTextfield(
                hint: "NAME", isSufix: false, controller: nameController),
            const SizedBox(height: 10),
            CustomTextfield(
                keybordtype: TextInputType.number,
                hint: "PHONE",
                isSufix: true,
                controller: phoneController),
            const SizedBox(height: 10),
            BlocConsumer<ProfileEditBloc, ProfileEditState>(
              listener: (context, state) {
                if (state is HostDataUpdateSuccsess) {
                  context.read<ProfileEditBloc>().add(UpdataHostDetails());
                } else if (state is SubmitSuccsessState) {
                  ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                      context, true, "Profile Updated Succsesfull"));
                } else if (state is SubmitFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackbar(context, false, state.messege));
                }
              },
              builder: (context, state) {
                return MyLoadingButton(
                  isLoading: state is SubmitLoadingState,
                  title: "Update",
                  onTap: () {
                    updateButtonClicked(
                        nameController.text, phoneController.text, context);
                  },
                );
              },
            )
          ]),
        ),
      ),
    );
  }

  updateButtonClicked(String name, String phone, BuildContext context) {
    // final hostModelData = getLoggedInHost();
    // imagePath = File(hostModelData.profile);
    if (imageChange) {
      if (name.isNotEmpty && phone.length == 10) {
        Map<String, dynamic> data = {"phone": phone, "name": name};
        context
            .read<ProfileEditBloc>()
            .add(SubmitClicked(image: imagePath, data: data));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(customSnackbar(context, false, "Add All Details"));
      }
    } else if (imageChange == false) {
      if (name.isNotEmpty && phone.length == 10) {
        Map<String, dynamic> data = {"phone": phone, "name": name};
        context.read<ProfileEditBloc>().add(SubmitClicked(data: data));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(customSnackbar(context, false, "Add All Details"));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackbar(context, false, "Add a Profile Photo"));
    }
  }
}
