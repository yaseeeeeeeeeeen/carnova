import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/resources/api_urls/host_url.dart';

class VehicleAddRepo {
  Future<http.StreamedResponse> addVehicle(Map<String, dynamic> vehicleData,
      List<File> images, File document) async {
    final url = Uri.parse(HostUrl.addVehicle);
    var request = http.MultipartRequest('POST', url);
    final token = SharedPreference.instance.getToken();
    // headers
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Cookie'] = 'jwtHost=$token';
    // send image
    for (var i = 0; i < images.length; i++) {
      var stream = http.ByteStream(images[i].openRead());
      var length = await images[i].length();

      var multipartFile = http.MultipartFile(
        'files',
        stream,
        length,
        filename: 'image$i.jpg',
      );

      request.files.add(multipartFile);
    }
    var documentStream = http.ByteStream(document.openRead());
    var documentLength = await document.length();
    var documentMultipartFile = http.MultipartFile(
      'doc',
      documentStream,
      documentLength,
      filename: 'document.jpg',
    );

    request.files.add(documentMultipartFile);
    request.fields['name'] = vehicleData['name'];
    request.fields['brand'] = vehicleData['brand'];
    request.fields['lat'] = vehicleData['lat'].toString();
    request.fields['long'] = vehicleData['long'].toString();
    request.fields['location'] = vehicleData['location'];
    request.fields["seat"] = vehicleData["seat"];
    request.fields['number'] = vehicleData['number'].toString();
    request.fields['price'] = vehicleData['price'].toString();
    request.fields['model'] = vehicleData['model'].toString();
    request.fields['transmission'] = vehicleData['transmission'];
    request.fields['fuel'] = vehicleData['fuel'];

    var response = await request.send();

    return response;
  }

  Future<http.StreamedResponse> editVehicle(
      String id, Map<String, dynamic> vehicleData, List<File> images) async {
    final url = Uri.parse('${HostUrl.editVehicle}/$id');
    var request = http.MultipartRequest('PATCH', url);
    final token = SharedPreference.instance.getToken();
    // HEADERS
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Cookie'] = 'jwtHost=$token';
    // SET SENDING IMAGES
    for (var i = 0; i < images.length; i++) {
      var stream = http.ByteStream(images[i].openRead());
      var length = await images[i].length();

      var multipartFile = http.MultipartFile(
        'files',
        stream,
        length,
        filename: 'image$i.jpg',
      );

      request.files.add(multipartFile);
    }
    request.fields['name'] = vehicleData['name'];
    request.fields['brand'] = vehicleData['brand'];
    request.fields['lat'] = vehicleData['lat'].toString();
    request.fields['long'] = vehicleData['long'].toString();
    request.fields['location'] = vehicleData['location'];
    request.fields["seat"] = vehicleData["seat"].toString();
    request.fields['number'] = vehicleData['number'].toString();
    request.fields['price'] = vehicleData['price'].toString();
    request.fields['model'] = vehicleData['model'].toString();
    request.fields['transmission'] = vehicleData['transmission'];
    request.fields['fuel'] = vehicleData['fuel'];

    var response = await request.send();

    return response;
  }
}



  // deleteVehicleImages(String vehicleId, String imageId, String token) async {
  //   final url = Uri.parse(
  //       '${HostUrl.baseUrl}/${HostUrl.deleteVehicleImage}/$vehicleId?file=$imageId');
  //   final header = {
  //     'Authorization': 'Bearer $token',
  //     'Cookie': 'jwtHost=$token',
  //     'Content-Type': 'application/json'
  //   };
  //   final body = await http.patch(url, headers: header);
  //   print(body.statusCode);
  // }
