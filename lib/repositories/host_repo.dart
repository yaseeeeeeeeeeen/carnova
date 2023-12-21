import 'package:second_project/data/network/api_services.dart';
import 'package:second_project/data/shared_preferance/shared_preferance.dart';
import 'package:second_project/resources/api_urls/host_url.dart';

class HostRepo {
  EitherResponse loginData(Map<String, String> mailandpass) {
    const url = HostUrl.hostLogin;
    return ApiService.postApi(mailandpass, url);
  }

  EitherResponse fetchHostData() {
    final token = SharedPreference.instance.getToken();
    const url = HostUrl.getHostData;
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
    print(url);
    final token = SharedPreference.instance.getToken();
    print(token);
    return ApiService.patchApi(url, token!);
  }
}
