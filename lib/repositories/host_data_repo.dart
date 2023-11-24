import 'dart:convert';
import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/host_data_modal.dart';

class HostDataRepo {
  Future<Map<String, dynamic>?> getHostData() async {
    final token = SharedPreference.instance.getToken();
    print('token is $token');
    if (token != null) {
      final response = await ApiServiceHost.instance.getHostDetails(token);
      print(response.statusCode);
      final body = jsonDecode(response.body);
      if (body['message'] != 'Internal server error') {
        final data = HostModel.fromJson(body);
        hostModelData = data;
        return body;
      }
    }
    return null;
  }
}
