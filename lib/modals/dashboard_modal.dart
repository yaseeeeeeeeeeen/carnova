// To parse this JSON data, do
//
//     final dashbordModal = dashbordModalFromJson(jsonString);

import 'dart:convert';

DashbordModal dashbordModalFromJson(String str) {
  final jsonData = json.decode(str);
  return DashbordModal.fromJson(jsonData);
}

String dashbordModalToJson(DashbordModal data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class DashbordModal {
  int hostRevenue;
  List<Trending> trending;
  int bookedCount;
  int completedCount;
  int cancelledBooking;
  List<LatestOrder> latestOrders;

  DashbordModal({
    required this.hostRevenue,
    required this.trending,
    required this.bookedCount,
    required this.completedCount,
    required this.cancelledBooking,
    required this.latestOrders,
  });

  factory DashbordModal.fromJson(Map<String, dynamic> json) => DashbordModal(
        hostRevenue: json["hostRevenue"],
        trending: List<Trending>.from(
            json["trending"].map((x) => Trending.fromJson(x))),
        bookedCount: json["bookedCount"],
        completedCount: json["completedCount"],
        cancelledBooking: json["cancelledBooking"],
        latestOrders: List<LatestOrder>.from(
            json["latestOrders"].map((x) => LatestOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hostRevenue": hostRevenue,
        "trending": List<dynamic>.from(trending.map((x) => x.toJson())),
        "bookedCount": bookedCount,
        "completedCount": completedCount,
        "cancelledBooking": cancelledBooking,
        "latestOrders": List<dynamic>.from(latestOrders.map((x) => x.toJson())),
      };
}

class LatestOrder {
  String id;
  String userId;
  String vehicleId;
  String startDate;
  String endDate;
  String pickup;
  String dropoff;
  int total;
  int grandTotal;
  String status;
  int v;
  Vehicle vehicleDetails;
  UserDetails userDetails;

  LatestOrder({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.startDate,
    required this.endDate,
    required this.pickup,
    required this.dropoff,
    required this.total,
    required this.grandTotal,
    required this.status,
    required this.v,
    required this.vehicleDetails,
    required this.userDetails,
  });

  factory LatestOrder.fromJson(Map<String, dynamic> json) => LatestOrder(
        id: json["_id"],
        userId: json["userId"],
        vehicleId: json["vehicleId"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        pickup: json["pickup"],
        dropoff: json["dropoff"],
        total: json["total"],
        grandTotal: json["grandTotal"],
        status: json["status"],
        v: json["__v"],
        vehicleDetails: Vehicle.fromJson(json["vehicleDetails"]),
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "vehicleId": vehicleId,
        "startDate": startDate,
        "endDate": endDate,
        "pickup": pickup,
        "dropoff": dropoff,
        "total": total,
        "grandTotal": grandTotal,
        "status": status,
        "__v": v,
        "vehicleDetails": vehicleDetails.toJson(),
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  String id;
  String name;
  String email;
  int phone;
  String password;
  bool isBlocked;
  int v;
  String? profile;
  int? wallet;
  // Choices choices;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.isBlocked,
    required this.v,
     this.profile,
     this.wallet,
    // required this.choices,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        isBlocked: json["isBlocked"],
        v: json["__v"],
        profile: json["profile"],
        wallet: json["wallet"],
        // choices: Choices.fromJson(json["choices"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "isBlocked": isBlocked,
        "__v": v,
        "profile": profile,
        "wallet": wallet,
        // "choices": choices.toJson(),
      };
}

// class Choices {
//   dynamic startDate;
//   dynamic endDate;
//   dynamic pickup;
//   dynamic dropoff;

//   Choices({
//     required this.startDate,
//     required this.endDate,
//     required this.pickup,
//     required this.dropoff,
//   });

//   factory Choices.fromJson(Map<String, dynamic> json) => Choices(
//         startDate: json["startDate"],
//         endDate: json["endDate"],
//         pickup: json["pickup"],
//         dropoff: json["dropoff"],
//       );

//   Map<String, dynamic> toJson() => {
//         "startDate": startDate,
//         "endDate": endDate,
//         "pickup": pickup,
//         "dropoff": dropoff,
//       };
// }

class Vehicle {
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

  Vehicle({
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

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
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

class Trending {
  Vehicle vehicle;

  Trending({
    required this.vehicle,
  });

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        vehicle: Vehicle.fromJson(json["vehicle"]),
      );

  Map<String, dynamic> toJson() => {
        "vehicle": vehicle.toJson(),
      };
}
