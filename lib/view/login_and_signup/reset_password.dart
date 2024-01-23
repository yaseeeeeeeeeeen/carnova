import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/login/login_bloc_bloc.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/resources/components/custom_textfield.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/utils/validations.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';

// ignore: must_be_immutable
class PasswordResetScreen extends StatelessWidget {
  PasswordResetScreen({super.key, required this.id});
  String id;
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        // centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Reset Password",
          style: TextStyle(
            color: secondColorH,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image.bg2), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Form(
            key: _formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: media.height / 6),
                Hero(
                    tag: "registernow",
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: secondColorH,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.directions_car_filled,
                            color: mainColorH,
                            size: 35,
                          ),
                        ))),
                const SizedBox(height: 25),
                Text(
                  "Add new password and restart your journey",
                  style: CustomFontStyles.listtilesText,
                ),
                const SizedBox(height: 25),
                MyTextField(
                    validation: (value) {
                      return Validations().passwordValidations(value);
                    },
                    controller: pass1Controller,
                    hintText: "Enter New Password",
                    obscureText: true),
                const SizedBox(height: 10),
                MyTextField(
                    validation: (value) {
                      return Validations()
                          .confirmpassValidations(value, pass1Controller.text);
                    },
                    controller: pass2Controller,
                    hintText: "Confirm Password",
                    obscureText: true),
                const SizedBox(height: 25),
                BlocConsumer<LoginBloc, LoginBlocState>(
                  listener: (context, state) {
                    if (state is PasswordResetedSuccsess) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                          context, true, "Password Changed.! Back To Login"));
                    }
                  },
                  builder: (context, state) {
                    return MyLoadingButton(
                        title: "DONE",
                        isLoading: state is LoginLoadingState,
                        onTap: () {
                          if (_formKey1.currentState!.validate()) {
                            context.read<LoginBloc>().add(ResetPasswordWithId(
                                id: id,
                                pass1: pass1Controller.text,
                                pass2: pass2Controller.text));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackbar(context, false,
                                    "Somethig Wrong Try Again"));
                          }
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
