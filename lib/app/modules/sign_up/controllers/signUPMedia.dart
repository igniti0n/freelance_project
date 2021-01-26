import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up/provider/signUp.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class SignUpMediaController extends GetxController with StateMixin {
  //TODO: Implement SignUpController

  final count = 0.obs;
  final value = "Select Gender".obs;

  @override
  void onInit() {
    super.onInit();
   
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
   register({
      String firtname,
      String lastname,
      String gender,
      String phone,
      String date_of_birth,
      String religion,
      String level_of_education,
      String country,
      String address,
      String email,
      String password,
      String facebook,
      String twitter,
      String instagram,
      String youtube,
    }) {
      RegisterProvider()
          .register(
        firtname: firtname,
        lastname: lastname,
        gender: gender,
        phone: phone,
        date_of_birth: date_of_birth,
        religion: religion,
        level_of_education: level_of_education,
        country: country,
        address: address,
        email: email,
        password: password,
        facebook: facebook,
        twitter: twitter,
        instagram: instagram,
        youtube: youtube,
      )
          .then((value) {
        change(value, status: RxStatus.success());
         Get.snackbar(
        "Success",
        value.message==null?"Success":value.message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      }, onError: (err) {
        change(null, status: RxStatus.error());
      });
    }
}
