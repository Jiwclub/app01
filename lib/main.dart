import 'package:app01/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/services/auth_service.dart';

initServices() async {
  Get.log('starting services ...');

  await Get.putAsync(() => AuthService().init());
}

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      theme: Themes.lightTheme,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}
