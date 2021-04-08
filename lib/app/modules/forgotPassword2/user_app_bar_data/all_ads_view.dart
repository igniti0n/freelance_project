import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/ads_card.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/header.dart';
import '../../../widgets/progress_dialog.dart';
import '../../home/controllers/home_controller.dart';
import 'app_bar_data_controller.dart';

class AllAdsView extends GetView<HomeController> {
  AllAdsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header,
      backgroundColor: Colors.white,
      body: controller.obx(
        (state) => _buildHomeView(),
        onLoading: Loader(),
        onError: (error) {
          return ErrorView(
            errorMsg: error,
            onTapReload: () {
              controller.loadAds();
            },
          );
        },
      ),
    );
  }

  _buildHomeView() {
    final String _welcomeText = "Here are all available Gids";

    return RefreshIndicator(
      displacement: 40,
      onRefresh: () async {
        Get.find<AppBarDataController>().loadAppBarData();
        controller.loadAds();
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
                            fontWeight: FontWeight.bold, color: Colors.black),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              child: Text(
                _welcomeText,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return showAdCard(
                  adsDetailModel: controller.adsList[index],
                  report: false,
                  onTabChangeIndex: (index) {
                    controller.loadAds();
                  });
            },
            childCount: controller.adsList.length,
          ))
        ],
      ),
    );
  }
}
