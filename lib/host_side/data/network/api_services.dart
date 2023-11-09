import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServiceHost {
  ApiServiceHost._();
  static final ApiServiceHost _instance = ApiServiceHost._();
  static ApiServiceHost get instance => _instance;

  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> hostSignup(Map<String, dynamic> hostDetails) async {
    final url = Uri.parse("http://10.4.3.48:3000/host/signup");
    final body = jsonEncode(hostDetails);

    final response = await http.post(url, body: body, headers: headers);
    // ignore: avoid_print
    print(response.statusCode);

    return response;
  }

  Future<http.Response> hostOtp(Map<String, int?> otp) async {
    final url = Uri.parse("http://10.4.3.48:3000/host/verify-otp");
    final body = jsonEncode(otp);
    final response = await http.post(url, body: body, headers: headers);
    // print(response.body);
    return response;
  }

  Future<http.Response> hostLogin(Map<String, String> mailAndPass) async {
    final url = Uri.parse("http://10.4.3.48:3000/host/login");
    final body = jsonEncode(mailAndPass);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }
}
