import 'package:second_project/host_side/data/network/api_services.dart';

class HostSignupRepo {
  hostSignup(Map<String, Object> signupData) async {
    final reponse = await ApiServiceHost.instance.hostSignup(signupData);
    return reponse;
  }
}
