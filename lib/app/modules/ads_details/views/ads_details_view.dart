import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/modules/ads_details/controllers/ads_details_controller.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:intl/intl.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:flutter/services.dart';
import 'package:test_project_one/app/widgets/social_media_icon_widget.dart';

class AdsDetailsView extends GetView<AdsDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: controller.obx(
        (state) => _buildDetailView(context),
        onLoading: Loader(),
        onError: (error) {
          return ErrorView(
            errorMsg: error,
            onTapReload: () {
              controller.getAdDetail();
            },
          );
        },
      ),
    );
  }

  _buildDetailView(BuildContext context) {
    final DateTime now = controller.adsDetailModel.createdAt;
    DateFormat formatter = DateFormat('dd LLL, yyyy');
    final String formatted = formatter.format(now);

    final DateTime deadline = controller.adsDetailModel.deadline;
    formatter = DateFormat('yyyy-MM-dd');
    final String deadlineFormatter = formatter.format(deadline);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                Image.asset("assets/images/banner.png"),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    formatted,
                    style: TextStyle(
                        fontFamily: "Gilroy-Regular",
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: Text(
                    controller.adsDetailModel.title,
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 22,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _buildSocialMediaIconWithCount(controller.adsDetailModel),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Text(
                controller.adsDetailModel.description,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 12),
            child: Row(
              children: [
                Container(
                  width: Get.width / 1.75,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/duration.svg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deadline",
                              style: TextStyle(
                                  color: Color(0xff500A84),
                                  fontFamily: "Gilroy",
                                  fontSize: 14),
                            ),
                            Container(
                              width: Get.width / 2.5,
                              child: RichText(
                                maxLines: 2,
                                text: TextSpan(
                                    text: 'To be completed in',
                                    style: TextStyle(
                                        fontFamily: "Gilroy-Regular",
                                        fontSize: 12,
                                        color: Color(0xff949494)),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " " + deadlineFormatter,
                                        style: TextStyle(
                                            fontFamily: "Gilroy-Regular",
                                            fontSize: 12,
                                            color: colour_time),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/anouncement.svg"),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gids Type",
                                style: TextStyle(
                                    color: colour_yellow,
                                    fontFamily: "Gilroy",
                                    fontSize: 14),
                              ),
                              Text(controller.adsDetailModel.adsType,
                                  style: TextStyle(
                                      fontFamily: "Gilroy-Regular",
                                      fontSize: 12,
                                      color: colour_time)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          (!controller.adsDetailModel.resources.isNull &&
                  controller.adsDetailModel.resources.length > 0)
              ? Container(
                  color: Color(0xffF9F9F9),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 24, bottom: 10, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.download_outlined,
                              color: colour_yellow,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Downloads",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 16,
                                  color: colour_yellow),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 36),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  controller.adsDetailModel.resources.length,
                                  (index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.adsDetailModel
                                                  .resources[index].title,
                                              style: TextStyle(
                                                  color: Color(0xff282828),
                                                  fontFamily: "Gilroy-Medium",
                                                  fontSize: 14,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            Text(
                                              controller.adsDetailModel
                                                  .resources[index].url,
                                              style: TextStyle(
                                                  color: colour_twitter,
                                                  fontFamily: "Gilroy-Medium",
                                                  fontSize: 14,
                                                  decoration:
                                                      TextDecoration.underline),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.copy_outlined),
                                        onPressed: () {
                                          Clipboard.setData(new ClipboardData(
                                              text: controller.adsDetailModel
                                                  .resources[index].url));
                                          Get.snackbar(
                                            Strings.SUCCESS,
                                            'URL copied to Clipboard',
                                            duration:
                                                Duration(milliseconds: 1000),
                                            backgroundColor: colour_time,
                                            colorText: Colors.white,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "G" + controller.adsDetailModel.amount,
            style: TextStyle(
                fontFamily: "Gilroy-Medium", fontSize: 26, color: Colors.black),
          )),
          SizedBox(
            height: 16,
          ),
          (controller.isMyAds || controller.adsDetailModel.status != "active")
              ? Container()
              : buttonWidget(
                  name: "Accept",
                  onTap: () {
                    controller.acceptAds();
                  }),
          SizedBox(
            height: 20,
          )
        ],
      ),
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
}
