import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/register.dart';
import 'package:test_project_one/app/modules/sign_up/provider/signUp.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class SignUpMediaController extends GetxController with StateMixin {
  //TODO: Implement SignUpController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  register({
    String firtname,
    String lastname,
    String gender,
    String phone = "",
    String dateOfBirth,
    String religion,
    String levelOfEducation,
    String country,
    String countryID,
    String address,
    String email,
    String password,
    String facebook,
    String twitter,
    String instagram,
    String youtube,
  }) async {
    try {
      RegisterProvider registerProvider = RegisterProvider();
      RegisterModel registerModel = await registerProvider.register(
        firstname: firtname,
        lastname: lastname,
        gender: gender,
        phone: phone,
        dateOfBirth: dateOfBirth,
        religion: religion,
        levelOfEducation: levelOfEducation,
        country: country,
        countryID: countryID,
        address: address,
        email: email,
        password: password,
        facebook: facebook,
        twitter: twitter,
        instagram: instagram,
        youtube: youtube,
      );
      change(registerModel, status: RxStatus.success());
      // Get.snackbar(
      //   Strings.SUCCESS,
      //   value.message ?? Strings.SOMETHING_WRONG,
      //   duration: Duration(milliseconds: 3000),
      //   backgroundColor: colour_time,
      //   colorText: Colors.white,
      // );
      Future.delayed(Duration(milliseconds: 100), () {
        Get.offAllNamed(Routes.SIGN_UP_INTEREST,
            arguments: registerModel.token);
      });
    } catch (onError) {
      change(onError.message, status: RxStatus.error());
      Get.snackbar(
        Strings.ERROR,
        onError.message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
    }
  }
}
