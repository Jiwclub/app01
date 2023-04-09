import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../data/models/login_model.dart';
import '../data/providers/home_provider.dart';
import '../routes/app_pages.dart';

class AuthService extends GetxService {
  AuthService();

  Future<AuthService> init() async {
    return this;
  }

  Rx<LoginModel> userProfile = LoginModel().obs;

  void submitLogin(String username, String password) async {
    EasyLoading.show(status: 'รอสักครู่...');
    LoginModel? res = await HomeApi().login(username, password);
    if (res != null) {
      userProfile.value = res;
      EasyLoading.dismiss();

      Get.offAllNamed(Routes.HOME);
      // Get.offAndToNamed(Routes.HOME);
      // Get.toNamed(Routes.HOME);
    } else {
      EasyLoading.showToast(
        'กรุณาตรวจสอบ username และ password อีกครั้ง',
      );
    }
  }
}
