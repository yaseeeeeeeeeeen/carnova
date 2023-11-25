class VehicleAddData {
  String name;
  String brand;
  String location;
  num model;
  String vehicleNumber;
  String? fuel;
  String? transmission;
  num? price;
  num latitude;
  num longitude;

  VehicleAddData(
      {required this.latitude,
      required this.location,
      required this.longitude,
      required this.name,
      required this.brand,
      required this.model,
     required this.vehicleNumber,
      this.fuel,
      this.transmission,
      this.price});

  factory VehicleAddData.fromJson(Map<String, dynamic> json) => VehicleAddData(
        brand: json["brand"],
        fuel: json["fuel"],
        location: json["location"],
        // images: json["images"],
        model: json["model"],
        name: json["name"],
        price: json["price"],
        latitude: json["lat"],
        longitude: json["long"],
        transmission: json["transmission"],
        vehicleNumber: json["vehicleNumber"]
      );

  Map<String, dynamic> toJson() => {
        "lat": latitude,
        "long": longitude,
        "location": location,
        "name": name,
         "vehicleNumber": vehicleNumber,
        "transmission": transmission,
        "fuel": fuel,
        "price": price,
        "model": model,
        // "images": images,
        "brand": brand,
      };
}
