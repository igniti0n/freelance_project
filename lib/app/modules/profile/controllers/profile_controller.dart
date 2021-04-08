import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/fileUploadModel.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/data/models/profileModel.dart';
import 'package:test_project_one/app/modules/profile/provider/profile.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/header.dart';
import 'package:test_project_one/main.dart';

class ProfileController extends GetxController
    with StateMixin<ProfileDetailModel> {
  //TODO: Implement ProfileController

  final count = 0.obs;
  File file;
  String religion;
  String gender;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setPickedImageFile({File value}) {
    file = value;
    change(this.state, status: RxStatus.success());
  }

  setReligion({String value}) {
    religion = value;
  }

  setGender({String value}) {
    this.gender = value;
  }

  getProfile() {
    ProfileProvider().getProfile().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error());
    });
  }

  Future<FileUploadModel> uploadFileToServer() async {
    try {
      return await ProfileProvider().uploadFileToServer(file);
    } catch (onError) {
      Get.snackbar(
        Strings.ERROR,
        onError.message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return null;
    }
  }

  updateProfile({
    String firstname,
    String lastname,
    String phone,
    String religion,
    String gender,
    String age,
    String education,
    String country,
    String address,
    String facebook,
    String twitter,
    String instagram,
    String youtube,
  }) async {
    Map body = {
      FIRST_NAME_PARAM: firstname,
      LAST_NAME_PARAM: lastname,
      PHONE_PARAM: phone,
      GENDER_PARAM: gender,
      RELIGION_PARAM: religion,
      LEVEL_OF_EDU_PARAM: education,
      COUNTRY_PARAM: country,
      ADDRESS_PARAM: address,
      FB_PARAM: facebook,
      TWITTER_PARAM: twitter,
      INSTA_PARAM: instagram,
      YT_PARAM: youtube,
    };

    if (file != null) {
      FileUploadModel fileUploadModel = await uploadFileToServer();
      if (fileUploadModel != null) {
        body[IMAGE_PARAM] = fileUploadModel.fileUrl;
      }
    }

    ProfileProvider().updateProfile(params: body).then(
        (profileDetailModel) async {
      if (profileDetailModel != null) {
        change(null, status: RxStatus.loading());
        //Update for Profile Image
        imageUrl.value = profileDetailModel.image;
        loginModel.user = profileDetailModel;
        final pref = await SharedPreferences.getInstance();
        pref.setString(kUserData, loginModelToJson(loginModel));

        getProfile();
      } else {
        change(null, status: RxStatus.error('Error While Updating Profile'));
      }
    }, onError: (error) {
      change(null, status: RxStatus.error());
    });
  }
}
