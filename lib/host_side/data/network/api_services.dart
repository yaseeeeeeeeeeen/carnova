import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:second_project/host_side/resources/api_urls/host_url.dart';

class ApiServiceHost {
  ApiServiceHost._();
  static final ApiServiceHost _instance = ApiServiceHost._();
  static ApiServiceHost get instance => _instance;

  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> hostSignup(Map<String, dynamic> hostDetails) async {
    final url = Uri.parse(HostUrl.signUpHost);
    final body = jsonEncode(hostDetails);

    final response = await http.post(url, body: body, headers: headers);
    // ignore: avoid_print
    print(response.statusCode);

    return response;
  }

  Future<http.Response> hostOtp(Map<String, int?> otp) async {
    final url = Uri.parse(HostUrl.verifyOtpHost);
    final body = jsonEncode(otp);
    final response = await http.post(url, body: body, headers: headers);
    // print(response.body);
    return response;
  }

  Future<http.Response> hostLogin(Map<String, String> mailAndPass) async {
    final url = Uri.parse(HostUrl.hostLogin);
    final body = jsonEncode(mailAndPass);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  getHostDetails(String token) async {
    final url = Uri.parse(HostUrl.getHostData);
    final header = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(url, headers: header);
    final body = jsonDecode(response.body);
    return body;
  }
}
