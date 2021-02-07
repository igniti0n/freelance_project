import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'colours.dart';
import 'social_media_icon_widget.dart';

showAdCard(
    {AdsDetailModel adsDetailModel,
    bool report,
    Function(int index) onTabChangeIndex}) {
  final DateTime now = adsDetailModel.deadline;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String deadlineFormatter = formatter.format(now);

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15, top: 10),
        child: Container(
          height: 298,
          width: 380,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0xff939393), blurRadius: 10, offset: Offset(0, 5))
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 298,
                width: 8,
                color: colour_yellow,
              ),
              Container(
                height: 298,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "G" + adsDetailModel.amount,
                        style: TextStyle(
                          fontFamily: "Gilroy-Medium",
                          fontSize: 14,
                          color: colour_price,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(adsDetailModel.title,
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 20,
                              color: colour_ads_header)),
                      SizedBox(
                        height: 10,
                      ),
                      _buildSocialMediaIconWithCount(adsDetailModel),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          adsDetailModel.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: "Gilroy-Regular",
                              fontSize: 12,
                              color: colour_alert_dialog),
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/small-clock.svg"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("To be completed in",
                              style: TextStyle(
                                  fontFamily: "Gilroy-Regular",
                                  fontSize: 12,
                                  color: Color(0xff949494))),
                          Text(" " + deadlineFormatter,
                              style: TextStyle(
                                  fontFamily: "Gilroy-Regular",
                                  fontSize: 12,
                                  color: colour_time)),
                          Spacer(),
                          SvgPicture.asset("assets/svg/small_speaker.svg"),
                          Text(" " + adsDetailModel.adsType,
                              style: TextStyle(
                                  fontFamily: "Gilroy-Regular",
                                  fontSize: 12,
                                  color: Color(0xff949494))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          _buildSocialMediaIcons(adsDetailModel),
                          Spacer(),
                          Visibility(
                            visible: report,
                            child: GestureDetector(
                              onTap: () => Get.toNamed(
                                  Routes.PERFORMANCE_LIST_REPORT,
                                  arguments: adsDetailModel),
                              child: Text("Report",
                                  style: TextStyle(
                                      fontFamily: "Gilroy-Medium",
                                      color: colour_yellow,
                                      fontSize: 14)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              var result = await Get.toNamed(Routes.ADS_DETAILS,
                                  arguments: [
                                    adsDetailModel,
                                    report ? true : false,
                                  ]);
                              if (result) {
                                onTabChangeIndex(1);
                              }
                            },
                            child: Text("View Details",
                                style: TextStyle(
                                    fontFamily: "Gilroy-Medium",
                                    color: colour_yellow,
                                    fontSize: 14)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

_buildSocialMediaIconWithCount(AdsDetailModel adsDetailModel) {
  List<SocialMediaCardModel> listWidgets =
      createSocialMediaList(adsDetailModel);
  return Row(
    children: List.generate(listWidgets.length, (index) {
      return Row(
        children: [
          SvgPicture.asset("assets/svg/small_" + listWidgets[index].iconName),
          SizedBox(
            width: 5,
          ),
          Text(
            adsDetailModel.facebookTarget.toString(),
            style: TextStyle(
                fontFamily: "Gilroy", fontSize: 12, color: colour_facebook),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      );
    }),
  );
}

_buildSocialMediaIcons(AdsDetailModel adsDetailModel) {
  List<SocialMediaCardModel> listWidgets =
      createSocialMediaList(adsDetailModel);

  return listWidgets.isEmpty
      ? Container(
          height: 36,
        )
      : Stack(
          overflow: Overflow.visible,
          children: List.generate(listWidgets.length, (index) {
            return Padding(
              padding: EdgeInsets.only(left: index * 30.0),
              child:
                  SvgPicture.asset("assets/svg/" + listWidgets[index].iconName),
            );
          }),
        );
}
