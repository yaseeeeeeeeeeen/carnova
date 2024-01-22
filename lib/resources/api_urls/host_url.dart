class HostUrl {
  // Local Host Postman[system]
  // static const String baseUrlH = "http://localhost:3000";

  // url with my ipaddress for usb debugging
  static const String baseUrl = "https://server.carnova.online";
  static const String baseUrlHost = "$baseUrl/host";
  static const String signUpHost = "$baseUrlHost/signup";
  static const String verifyOtpHost = "$baseUrlHost/verify-otp";
  static const String hostLogin = "$baseUrlHost/login";
  static const String getHostData = "$baseUrlHost/host-details";
  static const String addVehicle = "$baseUrlHost/add-vehicle";
  static const String addProfile = "$baseUrlHost/upload-profile";
  static const String updateProfile = "$baseUrlHost/update-host";
  static const String fetchVehicles = "$baseUrlHost/host-vehicles";
  static const String deleteVehicle = "$baseUrlHost/delete-vehicle";
  static const String deleteVehicleImage = "$baseUrlHost/delete-image";
  static const String editVehicle = "$baseUrlHost/edit-vehicle";
  static const String changepass = "$baseUrlHost/change-pass";
  static const String dashbord = "$baseUrlHost/dashboard";
  static const String forgetPassword = "$baseUrlHost/forgot-password";
  static const String resetPassword = "$baseUrlHost/reset-password/";
  static const String imagegettingUrl = "$baseUrl/admin/getFile/";
}
