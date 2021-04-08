import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project_one/app/modules/forgotPassword2/user_app_bar_data/app_bar_data_controller.dart';
import 'package:test_project_one/app/modules/my_ads/controllers/my_ads_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/ads_card.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/header.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

import '../../../../main.dart';

class MyAdsView extends GetView<MyAdsController> {
  final controller = Get.put(MyAdsController());

  final Function(int index) onChangeTabIndex;

  MyAdsView({this.onChangeTabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header,
      backgroundColor: Colors.white,
      body: controller.obx(
        (state) => RefreshIndicator(
          displacement: 40,
          onRefresh: () async {
            Get.find<AppBarDataController>().loadAppBarData();
            controller.loadMyAds();
            await new Future.delayed(const Duration(seconds: 1));
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                leading: Obx(() {
                  return CachedNetworkImage(
                    imageUrl: imageUrl.value,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 40,
                        backgroundImage: imageProvider,
                        backgroundColor: Colors.white),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: 50,
                    ),
                  );
                }),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: loginModel.user.firstname + ",",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMd('en_US').format(DateTime.now()),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                actions: [
                  GestureDetector(
                      onTap: () => Get.toNamed(Routes.CHAT),
                      child: SvgPicture.asset("assets/svg/chat.svg")),
                  SizedBox(
                    width: 30,
                  )
                ],
                //expandedHeight: kToolbarHeight + 50,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return showAdCard(
                      adsDetailModel: controller.adsList[index].ad.first,
                      report: true);
                },
                childCount: controller.adsList.length,
              ))
            ],
          ),
        ),
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

  _buildMyAdsView(Size screenSize) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.loadMyAds();
        await new Future.delayed(const Duration(seconds: 1));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: screenSize.height - 220,
            width: screenSize.width,
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
                          child:
                              Lottie.asset("assets/lottie/no_data_lottie.json"),
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
          ),
        ],
      ),
    );
  }
}
