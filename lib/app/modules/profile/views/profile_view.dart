import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  // final controllAuth = Get.put(LoginController());
  final authController = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Obx(
        () => SafeArea(
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        // backgroundColor: Colors.green,
                        child: Image.network(
                          "${authController.userProfile.value.image}",
                          fit: BoxFit.cover,
                          height: 80,
                        ),
                      ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: const BorderSide(color: Colors.white),
                                ),
                                backgroundColor: const Color(0xFFF5F6F9),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                      'ชื่อ : ${authController.userProfile.value.firstName} ${authController.userProfile.value.lastName}'),
                ),
                ListTile(
                  title:
                      Text('อีเมล : ${authController.userProfile.value.email}'),
                ),
                ListTile(
                  title:
                      Text('เพศ : ${authController.userProfile.value.gender}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
