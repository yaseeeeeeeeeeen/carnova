import 'package:flutter/material.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  String hint;
  bool isSufix;
  TextEditingController controller;
  TextInputType? keybordtype;
  bool? visiblity = true;
  CustomTextfield(
      {super.key,
      this.visiblity,
      this.keybordtype,
      required this.hint,
      required this.isSufix,
      required this.controller});

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    if (isSufix == false) {
      obscureText = false;
    }
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 15,
            //  width:double.maxFinite ,
            child: TextFormField(
              readOnly: visiblity ?? false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              textInputAction: TextInputAction.next,
              keyboardType: keybordtype,
              style: CustomFontStyles.hintstyleOne,
              decoration: InputDecoration(
                isDense: true,
                border: const OutlineInputBorder(),
                fillColor: Colors.transparent,
                filled: true,
                label: Text(hint),
                labelStyle: CustomFontStyles.hintstyleOne,
                errorBorder: const OutlineInputBorder(),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: black)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: borderColor, width: 1),
                ),
                hintText: hint,
                hintStyle: CustomFontStyles.hintstyleOne,
              ),
            )));
  }
}
