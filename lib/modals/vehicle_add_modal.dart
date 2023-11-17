import 'package:image_picker/image_picker.dart';

class VehicleAddData {
   String name;
    String brand;
   String modal;
   String vehicleNumber;
   String? fuel;
   String? transmission;
   String? price;
   List<XFile>? images;

  VehicleAddData(
      { this.images,
      required this.name,
      required this.brand,
      required this.modal,
      required this.vehicleNumber,
       this.fuel,
       this.transmission,
       this.price});

  factory VehicleAddData.fromJson(Map<String, dynamic> json) => VehicleAddData(
      brand: json["brand"],
      fuel: json["fuel"],
      images: json["images"],
      modal: json["modal"],
      name: json["name"],
      price: json["price"],
      transmission: json["transmission"],
      vehicleNumber: json["vehicleNumber"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "vehicleNumber": vehicleNumber,
        "transmission": transmission,
        "fuel": fuel,
        "price": price,
        "modal": modal,
        "images": images,
        "brand": brand,
      };
}
