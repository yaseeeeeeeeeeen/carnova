import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/style.dart';
import 'package:second_project/blocs/otp_verifiaction/otp_verfication_bloc.dart';
import 'package:second_project/blocs/signup/signup_bloc_bloc.dart';
import 'package:second_project/resources/components/custom_button.dart';
import 'package:second_project/utils/custom_navbar.dart';

import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/utils/functions/permissions.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';
import 'package:otp_text_field/otp_text_field.dart';

// ignore: must_be_immutable
class SignupOtpScreen extends StatelessWidget {
  SignupOtpScreen({super.key, required this.email});
  final String email;
  final otpController = TextEditingController();
  int? otp;
  bool complete = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image.bg2), fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Stack(children: [
                  Positioned(
                      child: Stack(children: [
                    Positioned(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height / 6),
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
                                  color: mainColorH,
                                  Icons.person,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "one time password  shared to this \nemail address.",
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "($email)",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 40),
                          Material(
                            color: Colors.transparent,
                            child: OTPTextField(
                                // controller: otpController,
                                length: 4,
                                keyboardType: TextInputType.phone,
                                width: MediaQuery.of(context).size.width,
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.box,
                                outlineBorderRadius: 8,
                                style: const TextStyle(fontSize: 17),
                                onChanged: (pin) {
                                  otpController.text = pin;
                                },
                                onCompleted: (pin) {
                                  complete = true;
                                  otp = int.parse(pin);
                                }),
                          ),
                          const SizedBox(height: 30),
                          BlocConsumer<HostOtpVerficationBloc,
                                  HostOtpVerficationState>(
                              listener: (context, state) {
                            if (state is SignupSuccsessState) {
                              navigateToHome(context);
                            } else if (state
                                is HostOtpVerificationFailedState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackbar(context, false,
                                      "Verification Failed Try again"));
                            } else if (state
                                is HostOtpVerificationTokenGetState) {
                              context
                                  .read<HostOtpVerficationBloc>()
                                  .add(DataGettedEvent(token: state.token));
                            }
                          }, builder: (context, state) {
                            bool isLoading =
                                state is HostOtpVerificationLoadingState;
                            return MyLoadingButton(
                              title: "Submit",
                              isLoading: isLoading,
                              onTap: () {
                                if (complete) {
                                  context.read<HostOtpVerficationBloc>().add(
                                      OtpVerifyButtonClicked(intOtp: otp!));
                                }
                              },
                            );
                          })
                        ]))
                  ]))
                ])),
          )),
    );
  }

  navigateToHome(context) async {
    Permissions permissions = Permissions();
    await permissions.locationPermissionChecking(context);
    await permissions.phoneCallPermissionChecking(context);
    await permissions.galleryPermissionChecking(context);
    await permissions.filesPermissionChecking(context);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenParant()),
        (route) => false);
  }
}
