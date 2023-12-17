import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';

class ApiServiceHost {
  ApiServiceHost._();
  static final ApiServiceHost _instance = ApiServiceHost._();
  static ApiServiceHost get instance => _instance;

  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> hostSignup(Map<String, dynamic> hostDetails) async {
    final url = Uri.parse(HostUrl.signUpHost);
    final body = jsonEncode(hostDetails);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> hostOtp(Map<String, int?> otp) async {
    final url = Uri.parse(HostUrl.verifyOtpHost);

    final body = jsonEncode(otp);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> hostLogin(Map<String, String> mailAndPass) async {
    final url = Uri.parse(HostUrl.hostLogin);
    final body = jsonEncode(mailAndPass);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> getHostDetails(String token) async {
    final url = Uri.parse(HostUrl.getHostData);
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }

  Future<http.StreamedResponse> profileUpdate(File image) async {
    final token = SharedPreference.instance.getToken();
    final url = Uri.parse(HostUrl.addProfile);
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Cookie'] = 'jwtHost=$token';
    var profilePhotoStream = http.ByteStream(image.openRead());
    var profilePhotoLength = await image.length();
    var profilePhotoMultipartFile = http.MultipartFile(
      'file',
      profilePhotoStream,
      profilePhotoLength,
      filename: 'profilephoto${hostModelData!.name}.jpg',
    );
    request.files.add(profilePhotoMultipartFile);
    final response = await request.send();
    return response;
  }

  Future<http.Response> vehicleDataFetching(String token) async {
       final url = Uri.parse(HostUrl.fetchVehicles);
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }
}
