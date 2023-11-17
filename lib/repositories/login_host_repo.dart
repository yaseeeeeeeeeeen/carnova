import 'package:second_project/data/network/api_services.dart';

class HostLoginRepo {
  hostLogin(Map<String, String> mailandpass) async {
    final response = await ApiServiceHost.instance.hostLogin(mailandpass);
    return response;
  }
}
