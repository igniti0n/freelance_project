import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/data/models/myAdDetailModel.dart';
import 'package:test_project_one/app/modules/ads_details/provider/ad_detail_provider.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class AdsDetailsController extends GetxController
    with StateMixin<AdsDetailModel> {
  //TODO: Implement AdsDetailsController
  AdsDetailModel adsDetailModel;
  bool isMyAds;
  AdDetailProvider _adDetailProvider;

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  void initializeData() {
    _adDetailProvider = AdDetailProvider();

    List<dynamic> arguments = Get.arguments;
    adsDetailModel = arguments.first;
    isMyAds = arguments.last ?? false;
    if (isMyAds) {
      getAdDetail();
    } else {
      change(adsDetailModel, status: RxStatus.success());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getAdDetail() async {
    try {
      change(null, status: RxStatus.loading());
      MyAdDetailModel myAdDetailModel =
          await _adDetailProvider.getAds(id: adsDetailModel.id);
      adsDetailModel = myAdDetailModel.data.first;
      change(adsDetailModel, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }

  acceptAds() async {
    try {
      Map<String, dynamic> response =
          await _adDetailProvider.acceptAds(id: adsDetailModel.id);
      String message = response[kMessage] ?? 'Request accepted';
      int statusCode = response[kStatusCode] ?? -1;
      Get.snackbar(Strings.SUCCESS, message,
          duration: Duration(milliseconds: 2000),
          backgroundColor: colour_time,
          colorText: Colors.white, snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          if (statusCode == 200) {
            Get.back(result: true);
          }
        }
      }, onTap: (obj) {
        Get.back(result: true);
      });
    } catch (onError) {
      Get.snackbar(Strings.ERROR, onError.message,
          duration: Duration(milliseconds: 2000),
          backgroundColor: colour_time,
          colorText: Colors.white, onTap: (obj) {
        Get.back(result: true);
      });
    }
  }
}
