// To parse this JSON data, do
//
//     final LocationData = LocationDataFromJson(jsonString);

import 'dart:convert';

LocationData locationDataFromJson(String str) {
  final jsonData = json.decode(str);
  return LocationData.fromJson(jsonData);
}

String locationDataToJson(LocationData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class LocationData {
  num latitude;
  num longitude;
  String address;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  factory LocationData.fromJson(Map<dynamic, dynamic> json) => LocationData(
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["Address"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "Address": address,
      };
}
