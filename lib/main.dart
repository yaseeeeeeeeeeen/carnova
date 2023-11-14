import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/host_side/blocs/Profile_edit/profile_edit_bloc.dart';
import 'package:second_project/host_side/blocs/document_upload/document_upload_bloc.dart';
import 'package:second_project/host_side/blocs/login/login_bloc_bloc.dart';
import 'package:second_project/host_side/blocs/otp_verifiaction/otp_verfication_bloc.dart';
import 'package:second_project/host_side/blocs/signup/signup_bloc_bloc.dart';
import 'package:second_project/host_side/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/user_side/utils/bottom_nav_bar.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.instance.initStorage();
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
        BlocProvider(create: (context) => ProfileEditBloc())
      ],
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: ScreenParantU(),),
    );
  }
}
