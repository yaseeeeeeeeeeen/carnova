import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:http/http.dart' as http;

class VehicleDataFetchRepo {
  Future<http.Response> vehicleDataFetch() async {
    final token = SharedPreference.instance.getToken();
    final response = await ApiServiceHost.instance.vehicleDataFetching(token!);
    return response;
  }
}
