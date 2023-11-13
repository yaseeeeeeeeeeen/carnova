class VehicleDataModal {
  final String name;
  final String brand;
  final String modal;
  final String vehicleNumber;
  final String fuel;
  final String transmission;
  final String price;
  final String coverPhoto;
  VehicleDataModal(
      {required this.coverPhoto,
      required this.name,
      required this.brand,
      required this.modal,
      required this.vehicleNumber,
      required this.fuel,
      required this.transmission,
      required this.price});
  factory VehicleDataModal.fromJson(Map<String, dynamic> data) =>
      VehicleDataModal(
          coverPhoto: data["coverPhoto"],
          name: data["name"],
          brand: data["brand"],
          modal: data["modal"],
          vehicleNumber: data["vehicleNumber"],
          fuel: data["fuel"],
          transmission: data["transmission"],
          price: data["price"]);
}

List<VehicleDataModal> vehiclesData = [];