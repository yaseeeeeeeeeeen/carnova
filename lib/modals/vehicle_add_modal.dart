class VehicleAddData {
  String name;
  String brand;
  String location;
  String model;
  String number;
  String? fuel;
  String seat;
  String? transmission;
  num? price;
  num latitude;
  num longitude;

  VehicleAddData(
      {required this.latitude,
      required this.location,
      required this.longitude,
      required this.seat,
      required this.name,
      required this.brand,
      required this.model,
      required this.number,
      this.fuel,
      this.transmission,
      this.price});

  factory VehicleAddData.fromJson(Map<String, dynamic> json) => VehicleAddData(
      brand: json["brand"],
      fuel: json["fuel"],
      seat: json["seat"],
      location: json["location"],
      // images: json["images"],
      model: json["createdyear"],
      name: json["name"],
      price: json["price"],
      latitude: json["lat"],
      longitude: json["long"],
      transmission: json["transmission"],
      number: json["number"]);

  Map<String, dynamic> toJson() => {
        "lat": latitude,
        "long": longitude,
        "location": location,
        "name": name,
        "number": number,
        "transmission": transmission,
        "fuel": fuel,
        "price": price,
        "createdyear": model,
        "seat": seat,
        // "images": images,
        "brand": brand,
      };
}
