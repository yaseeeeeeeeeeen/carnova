import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationPickService {
  Position? _currentLocation;
  late String _currentAddress = '';
  Map<dynamic, dynamic> dynamicMap = {};

  bool _serviceEnabled = false;
  late LocationPermission _permission = LocationPermission.denied;

  Future<Map<dynamic, dynamic>> getCurrentLocation() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return {};
    }

    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        // Handle if permission is denied
        return {};
      }
    }

    _currentLocation = await Geolocator.getCurrentPosition();
    if (_currentLocation != null) {
      _currentAddress = await _getAddress();
      print(_currentAddress);
    }
    dynamicMap = {
      "latitude": _currentLocation!.latitude,
      "longitude": _currentLocation!.longitude,
      "Address": _currentAddress
    };
    return dynamicMap;
  }

  Future<String> _getAddress() async {
    try {
      if (_currentLocation != null) {
        List<Placemark> placeMarks = await placemarkFromCoordinates(
            _currentLocation!.latitude, _currentLocation!.longitude);
        Placemark place = placeMarks[0];
        String address =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
        return address;
      } else {
        print("Location is null");
        return "";
      }
    } catch (e) {
      print(e);
      return "";
    }
  }
}
