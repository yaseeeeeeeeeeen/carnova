// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/host_side/blocs/signup/signup_bloc_bloc.dart';
import 'package:second_project/host_side/resources/components/custom_button.dart';
import 'package:second_project/host_side/resources/components/custom_textfield.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';
import 'package:second_project/host_side/utils/snackbar.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';
import 'package:second_project/host_side/view/login_and_signup/signup_otp.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final firstnameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final conformpasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, Object> userData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image.bg2), fit: BoxFit.cover)),
        child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Hero(
                                tag: "registernow",
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: secondColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    color: mainColor,
                                    Icons.person,
                                    size: 35,
                                  )),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Create an account",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Sign up to join",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 20),
                              MyTextField(
                                validation: (p0) =>
                                    validations.nameValidation(p0),
                                controller: firstnameController,
                                hintText: 'Name',
                                obscureText: false,
                              ),
                              const SizedBox(height: 12),
                              MyTextField(
                                validation: (p0) =>
                                    validations.emailValidation(p0),
                                controller: emailController,
                                number: TextInputType.emailAddress,
                                hintText: 'Email',
                                obscureText: false,
                              ),
                              const SizedBox(height: 12),
                              MyTextField(
                                validation: (p0) =>
                                    validations.phoneNumberValidate(p0),
                                controller: phoneNumberController,
                                hintText: 'Mobile Number',
                                obscureText: false,
                                number: TextInputType.number,
                              ),
                              const SizedBox(height: 12),
                              MyTextField(
                                validation: (p0) =>
                                    validations.passwordValidations(p0),
                                controller: passwordController,
                                hintText: 'Password',
                                obscureText: false,
                              ),
                              const SizedBox(height: 12),
                              MyTextField(
                                validation: (p0) =>
                                    validations.confirmpassValidations(
                                        p0, passwordController.text),
                                controller: conformpasswordController,
                                hintText: 'Conform Password',
                                obscureText: false,
                              ),
                              const SizedBox(height: 20),
                              BlocConsumer<SignupBloc, SignupBlocState>(
                                listener: (context, state) {
                                  if (state is SignupSuccsessState) {
                                    customSnackbar(
                                        context, true, "Welcome To Carnova.");
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupOtpScreen(
                                                    email: userData["email"]
                                                        .toString())));
                                  } else if (state is SignupFaildState) {
                                    customSnackbar(context, false,
                                        "SignIn Failed Try again");
                                  } else if (state is SignupErrorState) {
                                    customSnackbar(
                                        context, false, "Something Wrong");
                                  }
                                },
                                builder: (context, state) {
                                  bool isLoading = state is SignupLoadingState;
                                  return MyLoadingButton(
                                      isLoading: isLoading,
                                      title: 'Sign Up',
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          final data = await signup();
                                          context.read<SignupBloc>().add(
                                              SignupClickedEvent(
                                                  signupData: data));
                                        }
                                      });
                                },
                              ),
                              const SizedBox(height: 40),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Have an account?',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    const SizedBox(width: 4),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ])
                            ]))))),
      ),
    );
  }

  signup() async {
    final phone = int.parse(phoneNumberController.text.trim());
    userData = {
      "name": firstnameController.text,
      "email": emailController.text,
      "phone": phone,
      "password": passwordController.text,
      "confirmPass": conformpasswordController.text
    };

    return userData;
  }
}
