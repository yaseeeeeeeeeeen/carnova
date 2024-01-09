import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/resources/api_urls/host_url.dart';

class HostRepo {
  String? token = SharedPreference.instance.getToken();
  EitherResponse loginData(Map<String, String> mailandpass) {
    const url = HostUrl.hostLogin;
    return ApiService.postApi(mailandpass, url);
  }

  EitherResponse fetchHostData() {
    const url = HostUrl.getHostData;
    return ApiService.getApi(url, token);
  }

  EitherResponse fetchDashboard() {
    const url = HostUrl.dashbord;
    return ApiService.getApi(url, token);
  }

  EitherResponse signup(Map<String, Object> signupData) {
    const url = HostUrl.signUpHost;
    return ApiService.postApi(signupData, url);
  }

  EitherResponse otpverificatio(Map<String, int?> otp) {
    const url = HostUrl.verifyOtpHost;
    return ApiService.postApi(otp, url);
  }

  EitherResponse updateData(Map<String, dynamic> data) {
    const url = HostUrl.updateProfile;
    final token = SharedPreference.instance.getToken();
    return ApiService.patchApi(data, url, token);
  }

  EitherResponse vehicleDataFetching() {
    const url = HostUrl.fetchVehicles;
    final token = SharedPreference.instance.getToken();
    return ApiService.getApi(url, token);
  }

  EitherResponse vehicleDelete(String id) {
    final url = "${HostUrl.deleteVehicle}/$id";
    final token = SharedPreference.instance.getToken();
    return ApiService.deleteApi(url, token);
  }

  EitherResponse vehicleImageDelete(String vehicleId, String imageId) {
    final url = '${HostUrl.deleteVehicleImage}/$vehicleId?file=$imageId';
    final token = SharedPreference.instance.getToken();
    return ApiService.patchApi(url, token!);
  }

  EitherResponse resetPassword(Map<String, dynamic> data) {
    const url = HostUrl.changepass;
    return ApiService.patchApi(data, url, token);
  }

  EitherResponse forgetPassword(String email) async {
    Map<String, dynamic> data = {"email": email};
    const url = HostUrl.forgetPassword;
    return ApiService.postApi(data, url);
  }

  EitherResponse forgetPassChange(String pass1, String pass2, String id) async {
    Map<String, dynamic> data = {"newpass": pass1, "confirmpass": pass2};
    String url = "${HostUrl.resetPassword}$id";
    return ApiService.patchApi(data, url);
  }
}
