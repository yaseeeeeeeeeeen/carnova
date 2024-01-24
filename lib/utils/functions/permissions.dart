import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class Permissions {
  bool _serviceEnabled = false;
  late LocationPermission _locationPermission;

  Future<void> locationPermissionChecking(BuildContext context) async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      // Handle when location service is disabled
      return;
    }

    _locationPermission = await Geolocator.checkPermission();
    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
      if (_locationPermission == LocationPermission.denied) {
        // Handle when location permission is denied
        return;
      }
    }
  }

  Future<bool> phoneCallPermissionChecking(BuildContext context) async {
    PermissionStatus status = await Permission.phone.status;
    if (status.isDenied) {
      // Request phone call permission
      status = await Permission.phone.request();
      if (status.isDenied) {
        // Handle when phone call permission is denied
        return false;
      }
    }
    return true; // Permission is granted
  }

  Future<bool> galleryPermissionChecking(BuildContext context) async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) {
      // Request storage/gallery permission
      status = await Permission.storage.request();
      if (status.isDenied) {
        // Handle when gallery permission is denied
        return false;
      }
    }
    return true; // Permission is granted
  }

  Future<bool> filesPermissionChecking(BuildContext context) async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) {
      // Request storage/files permission
      status = await Permission.storage.request();
      if (status.isDenied) {
        // Handle when files permission is denied
        return false;
      }
    }
    return true; // Permission is granted
  }
}
