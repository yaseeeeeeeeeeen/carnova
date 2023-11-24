import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/profile_edit/profile_edit_bloc.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/resources/components/custom_textfield2.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';

// ignore: must_be_immutable
class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarH("PROFILE EDIT"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            BlocBuilder<ProfileEditBloc, ProfileEditState>(
              builder: (context, state) {
                if (state is ProfileImageAddedState) {
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
                                backgroundImage: FileImage(File(imagePath!)),
                                radius: 80,
                              )
                            : CircleAvatar(
                                //show previews profile photo
                                backgroundImage:
                                    AssetImage(image.profilePhotoDemo),
                                radius: 80,
                              )),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomTextfield(
                hint: hostModelData!.name,
                isSufix: false,
                controller: nameController),
            const SizedBox(height: 10),
            CustomTextfield(
                hint: hostModelData!.email,
                isSufix: false,
                controller: emailController),
            const SizedBox(height: 10),
            CustomTextfield(
                keybordtype: TextInputType.number,
                hint: hostModelData!.phone.toString(),
                isSufix: true,
                controller: phoneController),
            const SizedBox(height: 10),
            MyButton(
              title: "Update",
              onTap: () {},
            )
          ]),
        ),
      ),
    );
  }
}
