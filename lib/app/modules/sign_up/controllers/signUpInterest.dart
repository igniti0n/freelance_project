import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/interestModel.dart';
import 'package:test_project_one/app/modules/sign_up/provider/sign_up_interest_provider.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class SignUpInterestController extends GetxController
    with StateMixin<InterestModel> {
  String _token;
  List selectedTags = [].obs;
  List intersts = [].obs;

  @override
  void onInit() {
    _token = Get.arguments;
    fetchInterests();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  setSelectedTags({List<String> tags}) {
    selectedTags = tags;
    change(null, status: RxStatus.success());
  }

  @override
  void onClose() {}

  fetchInterests() async {
    try {
      change(null, status: RxStatus.loading());
      SignUpInterestProvider provider = SignUpInterestProvider();
      InterestModel interestModel =
          await provider.fetchInterests(token: _token);
      intersts.clear();
      intersts.addAll(interestModel.data);
      change(interestModel, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }

  Future<bool> postInterests() async {
    if (selectedTags.isEmpty) {
      Get.snackbar(Strings.ERROR, Strings.TAGS_NOT_SEL,
          duration: Duration(milliseconds: 2000),
          backgroundColor: colour_time,
          colorText: Colors.white, onTap: (obj) {
        Get.back(result: true);
      });
      return false;
    } else if (selectedTags.length > 5) {
      Get.snackbar(Strings.ERROR, Strings.TAGS_VALIDATION_MSG,
          duration: Duration(milliseconds: 2000),
          backgroundColor: colour_time,
          colorText: Colors.white, onTap: (obj) {
        Get.back(result: true);
      });
      return false;
    }
    List<String> ids = [];
    selectedTags.forEach((tag) {
      InterestDetails filtered =
          intersts.cast<InterestDetails>().toList().firstWhere((interest) {
        return interest.interest == tag;
      });
      ids.add(filtered.id);
    });
    try {
      SignUpInterestProvider provider = SignUpInterestProvider();
      bool isSuccess =
          await provider.postInterests(interests: ids, token: _token);
      return isSuccess;
    } catch (onError) {
      Get.snackbar(Strings.ERROR, onError.message,
          duration: Duration(milliseconds: 2000),
          backgroundColor: colour_time,
          colorText: Colors.white, onTap: (obj) {
        Get.back(result: true);
      });
      return false;
    }
  }
}
