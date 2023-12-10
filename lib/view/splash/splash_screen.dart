import 'package:flutter/material.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/repositories/host_data_repo.dart';
import 'package:second_project/utils/custom_navbar.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loginCheck( context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image.appLogoBlack), fit: BoxFit.cover)),
        height: 200,
        width: 300,
      )),
    );
  }

  loginCheck(context) async {
    await Future.delayed(const Duration(seconds: 2));

    final hostData = await HostDataRepo().getHostData();
    if (hostData != null) {
      HostModel data = HostModel.fromJson(hostData);
      hostModelData = data;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ScreenParant()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false);
    }
  }
}
