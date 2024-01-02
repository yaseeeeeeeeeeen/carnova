import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/resources/api_urls/host_url.dart';

////////////////////////////
import 'package:either_dart/either.dart';
import 'package:second_project/utils/app_exceptions.dart';

class ApiServiceHost {
  final hostModelData = getLoggedInHost();
  ApiServiceHost._();
  static final ApiServiceHost _instance = ApiServiceHost._();
  static ApiServiceHost get instance => _instance;
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
}

//////////////////////

typedef EitherResponse = Future<Either<AppExceptions, dynamic>>;

class ApiService {
  static Map<String, String> header = {"Content-Type": "application/json"};

  static EitherResponse getApi(String url, [String? token]) async {
    if (token != null) {
      header["Authorization"] = "Bearer $token";
      header["Cookie"] = 'jwtHost=$token';
      header["Content-Type"] = 'application/json';
    }
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri, headers: header);
      final body = getResponse(response);
      return Right(body);
    } on SocketException {
      return Left(InterntExceptions());
    } on http.ClientException {
      return Left(BadRequestExceptions());
    } catch (e) {
      return Left(RequestTimeOutExceptions());
    }
  }

  static EitherResponse postApi(var data, String url, [String? token]) async {
    if (token != null) {
      header["Authorization"] = "Bearer $token";
      header["Cookie"] = 'jwtHost=$token';
    }
    final uri = Uri.parse(url);
    final body = jsonEncode(data);
    try {
      final response = await http.post(uri, body: body, headers: header);
      final responseBody = getResponse(response);
      return Right(responseBody);
    } on SocketException {
      return Left(InterntExceptions());
    } on http.ClientException {
      return Left(BadRequestExceptions());
    } catch (e) {
      return Left(RequestTimeOutExceptions());
    }
  }

  Future<http.Response> deleteVehicleImages(
      String vehicleId, String imageId, String token) async {
    final url =
        Uri.parse('${HostUrl.deleteVehicleImage}/$vehicleId?file=$imageId');
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token',
      'Content-Type': 'application/json'
    };
    final body = await http.patch(url, headers: header);
    return body;
  }

  static EitherResponse patchApi(var data, String url, [String? token]) async {
    if (token != null) {
      header["Authorization"] = "Bearer $token";
      header["Cookie"] = 'jwtHost=$token';
    }
    final uri = Uri.parse(url);
    final body = jsonEncode(data);
    try {
      final response = await http.patch(uri, body: body, headers: header);
      print(response.statusCode);
      Map<String, dynamic> responseBody = getResponse(response);
      return Right(responseBody);
    } on SocketException {
      return Left(InterntExceptions());
    } on http.ClientException {
      return Left(BadRequestExceptions());
    } catch (e) {
      return Left(RequestTimeOutExceptions());
    }
  }

  static EitherResponse deleteApi(String url, [String? token]) async {
    if (token != null) {
      header["Authorization"] = "Bearer $token";
      header["Cookie"] = 'jwtHost=$token';
    }
    final uri = Uri.parse(url);
    try {
      final response = await http.delete(
        uri,
        headers: header,
      );
      final responseBody = getResponse(response);
      return Right(responseBody);
    } on SocketException {
      return Left(InterntExceptions());
    } on http.ClientException {
      return Left(BadRequestExceptions());
    } catch (e) {
      return Left(RequestTimeOutExceptions());
    }
  }

  static EitherResponse putApi(var data, String url, [String? token]) async {
    if (token != null) {
      header["Authorization"] = "Bearer $token";
      header["Cookie"] = 'jwtHost=$token';
    }
    final uri = Uri.parse(url);
    final body = jsonEncode(data);

    try {
      final response = await http.put(
        uri,
        body: body,
        headers: header,
      );
      final responseBody = getResponse(response);
      return Right(responseBody);
    } on SocketException {
      return Left(InterntExceptions());
    } on http.ClientException {
      return Left(BadRequestExceptions());
    } catch (e) {
      return Left(RequestTimeOutExceptions());
    }
  }

  static getResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      throw BadRequestExceptions();
    } else if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw BadRequestExceptions();
    }
  }
}
