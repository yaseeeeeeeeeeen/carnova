import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';

class HostDataRepo {
  getHostData() async {
    final token = SharedPreference.instance.getToken();
    if (token != null) {
      final userData = await ApiServiceHost.instance.getHostDetails(token);
      return userData;
    } else {
      return null;
    }
  }
}
