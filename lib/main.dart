import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/document_upload/document_upload_bloc.dart';
import 'package:second_project/blocs/login/login_bloc_bloc.dart';
import 'package:second_project/blocs/otp_verifiaction/otp_verfication_bloc.dart';
import 'package:second_project/blocs/password_settings/password_settings_bloc.dart';
import 'package:second_project/blocs/profile_edit/profile_edit_bloc.dart';
import 'package:second_project/blocs/signup/signup_bloc_bloc.dart';
import 'package:second_project/blocs/vehicle_add/vehicle_add_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/view/login_and_signup/reset_password.dart';
import 'package:second_project/view/splash/splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.instance.initStorage();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => HostOtpVerficationBloc()),
        BlocProvider(create: (context) => DocumentUploadBloc()),
        BlocProvider(create: (context) => ProfileEditBloc()),
        BlocProvider(create: (context) => VehicleAddBloc()),
        BlocProvider(create: (context) => VehicleFetchBloc()),
        BlocProvider(create: (context) => PasswordSettingsBloc())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
