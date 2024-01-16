// To parse this JSON data, do
//
//     final vehicleFetchModal = vehicleFetchModalFromJson(jsonString);

import 'dart:convert';

// List<VehicleFetchModal> vehicleFetchModalFromJson(String str) {
//   final List<Map<String, dynamic>> jsonData = json.decode(str);
//   return jsonData.map((e) => VehicleFetchModal.fromJson(e)).toList();
//   // return List<VehicleFetchModal>.from(
//   //     jsonData.map((x) => VehicleFetchModal.fromJson(x)));
// }

String vehicleFetchModalToJson(List<VehicleFetchModal> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));  
  return json.encode(dyn);
}

class VehicleFetchModal {
  String id;
  String name;
  int price;
  int model;
  String transmission;
  String brand;
  String number;
  int seat;
  String fuel;
  String location;
  double lat;
  double long;
  String createdBy;
  List<String> images;
  bool isVerified;
  List<dynamic> review;
  int v;
  String document;

  VehicleFetchModal({
    required this.id,
    required this.name,
    required this.price,
    required this.model,
    required this.transmission,
    required this.brand,
    required this.number,
    required this.seat,
    required this.fuel,
    required this.location,
    required this.lat,
    required this.long,
    required this.createdBy,
    required this.images,
    required this.isVerified,
    required this.review,
    required this.v,
    required this.document,
  });

  factory VehicleFetchModal.fromJson(Map<String, dynamic> json) =>
      VehicleFetchModal(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        model: json["createdyear"],
        transmission: json["transmission"],
        brand: json["brand"],
        number: json["number"],
        seat: json["seat"],
        fuel: json["fuel"],
        location: json["location"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        createdBy: json["createdBy"],
        images: List<String>.from(json["images"].map((x) => x)),
        isVerified: json["isVerified"],
        review: List<dynamic>.from(json["review"].map((x) => x)),
        v: json["__v"],
        document: json["document"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "createdyear": model,
        "transmission": transmission,
        "brand": brand,
        "number": number,
        "seat": seat,
        "fuel": fuel,
        "location": location,
        "lat": lat,
        "long": long,
        "createdBy": createdBy,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isVerified": isVerified,
        "review": List<dynamic>.from(review.map((x) => x)),
        "__v": v,
        "document": document,
      };
}
