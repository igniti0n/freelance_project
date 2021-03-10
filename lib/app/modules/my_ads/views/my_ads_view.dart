import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project_one/app/modules/my_ads/controllers/my_ads_controller.dart';
import 'package:test_project_one/app/widgets/ads_card.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

class MyAdsView extends GetView<MyAdsController> {
  final controller = Get.put(MyAdsController());

  final Function(int index) onChangeTabIndex;

  MyAdsView({this.onChangeTabIndex});

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
    return RefreshIndicator(
      onRefresh: () async {
        controller.loadMyAds();
        await new Future.delayed(const Duration(seconds: 1));
      },
      child: controller.adsList.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return showAdCard(
                    adsDetailModel: controller.adsList[index].ad.first,
                    report: true);
              },
              itemCount: controller.adsList.length,
            )
          : Center(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: Lottie.asset("assets/lottie/no_data_lottie.json"),
                  ),
                  Text(
                    Strings.NO_ADS_MSG,
                    style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buttonWidget(
                      name: 'Add Gids',
                      onTap: () {
                        onChangeTabIndex(0);
                      }),
                ],
              ),
            ),
    );
  }
}
