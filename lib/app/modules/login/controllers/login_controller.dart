import 'package:get/get.dart';

import '../../../data/models/login_model.dart';

class LoginController extends GetxController {
  Rx<LoginModel> userProfile = LoginModel().obs;
}
