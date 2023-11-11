import 'package:flutter/material.dart';
import 'package:second_project/host_side/data/network/api_services.dart';
import 'package:second_project/host_side/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/host_side/modals/host_data_modal.dart';
import 'package:second_project/host_side/resources/components/custom_navbar.dart';
import 'package:second_project/host_side/view/login_and_signup/login_screen.dart';

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
      // Get host details call
      final hostData = await ApiServiceHost.instance.getHostDetails(token);
      if (hostData != null) {
        HostModel data = HostModel.fromJson(hostData);
                Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const ScreenParant()),
            (route) => false);
      } else {
        //Token Expirity checking
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      }
    } else {
      // no token
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false);
    }
  }
}
