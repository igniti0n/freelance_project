import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/my_ads/controllers/my_ads_controller.dart';
import 'package:test_project_one/app/widgets/ads_card.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

class MyAdsView extends GetView<MyAdsController> {
  final controller = Get.put(MyAdsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: controller.obx(
        (state) => _buildMyAdsView(),
        onLoading: Loader(),
        onError: (error) {
          return ErrorView(
            errorMsg: error,
            onTapReload: () {
              controller.loadMyAds();
            },
          );
        },
      ),
    );
  }

  _buildMyAdsView() {
    return controller.adsList.isNotEmpty
        ? ListView.builder(
            itemBuilder: (context, index) {
              return showAdCard(
                  adsDetailModel: controller.adsList[index].ad.first,
                  report: true);
            },
            itemCount: controller.adsList.length,
          )
        : Center(
            child: Text(
              Strings.NO_ADS_MSG,
              style: TextStyle(
                  fontFamily: "Gilroy-Light",
                  fontSize: 22,
                  color: Colors.black),
            ),
          );
  }
}
