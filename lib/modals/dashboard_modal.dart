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
  Trending trending;
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
        trending: Trending.fromJson(json["trending"]),
        bookedCount: json["bookedCount"],
        completedCount: json["completedCount"],
        cancelledBooking: json["cancelledBooking"],
        latestOrders: List<LatestOrder>.from(
            json["latestOrders"].map((x) => LatestOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hostRevenue": hostRevenue,
        "trending": trending.toJson(),
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
  Trending vehicleDetails;
  UserDetails userDetails;

  LatestOrder(
      {required this.id,
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
      required});

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
        vehicleDetails: Trending.fromJson(json["vehicleDetails"]),
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
  String profile;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.isBlocked,
    required this.v,
    required this.profile,
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
      };
}

class Trending {
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

  Trending({
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

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        model: json["model"],
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
        "model": model,
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
