import 'package:flutter/material.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/repositories/host_repo.dart';
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
    loginCheck(context);
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
    final token = SharedPreference.instance.getToken();
    if (token != null) {
      final response = await HostRepo().fetchHostData();
      print(response);
      response.fold((left) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      }, (right) {
        print(right);
        if (right["_id"] != null) {
          HostModel host = HostModel.fromJson(right);
          print("modal data $host");
          hostModelData = host;
          print(hostModelData?.name);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => ScreenParant()),
              (route) => false);
          /////////////////////////////// blocked host screen create/////////////////////////////
        }
      });
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }
}
