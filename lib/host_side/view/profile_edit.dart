import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/host_side/blocs/Profile_edit/profile_edit_bloc.dart';
import 'package:second_project/host_side/modals/host_data_modal.dart';
import 'package:second_project/host_side/resources/components/custom_button.dart';
import 'package:second_project/host_side/resources/components/custom_textfield2.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';
import 'package:second_project/host_side/utils/appbar.dart';

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
                  child: CircleAvatar(
                      radius: 85,
                      backgroundColor: appbarColorH,
                      child: imagePath != null
                          ? CircleAvatar(
                              backgroundImage: FileImage(File(imagePath!)),
                              radius: 80,
                            )
                          : const CircleAvatar(
                              //show previews profile photo
                              backgroundColor: Colors.black12,
                              radius: 80,
                            )),
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
