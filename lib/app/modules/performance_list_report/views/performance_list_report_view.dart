import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/performance_list_report/controllers/performance_list_report_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:intl/intl.dart';

class PerformanceListReportView
    extends GetView<PerformanceListReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: controller.obx(
        (state) => _buildView(),
        onLoading: Loader(),
        onError: (error) {
          return ErrorView(
            errorMsg: error,
            onTapReload: () {
              controller.loadReports();
            },
          );
        },
      ),
    );
  }

  _buildView() {
    return controller.reportList.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    child: buttonWidget(
                        name: 'Submit',
                        onTap: () async {
                          final result = await Get.toNamed(
                              Routes.PERFORMANCE_REPORT,
                              arguments: controller.adsDetailModel);
                          if (result) {
                            controller.loadReports();
                          }
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.reportList.length,
                  itemBuilder: (context, index) {
                    final DateTime now = controller.reportList[index].createdAt;
                    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
                    final String timeCreatedFormatted = formatter.format(now);
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 16,
                                  color: Color(0xff939393).withOpacity(0.2))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  timeCreatedFormatted,
                                  style: TextStyle(
                                      fontFamily: "Gilroy",
                                      fontSize: 20,
                                      color: Color(0xff010101)),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                controller.reportList[index].description ?? "",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "Gilroy-Regular",
                                    fontSize: 12,
                                    color: Color(0xff717171)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, top: 16, bottom: 20),
                              child: _getImage(
                                  controller.reportList[index].socialMedia),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        : Center(
            child: Text(
              Strings.NO_REPORTS_MSG,
              style: TextStyle(
                  fontFamily: "Gilroy-Light",
                  fontSize: 22,
                  color: Colors.black),
            ),
          );
    ;
  }

  _getImage(String name) {
    switch (name) {
      case "youtube":
        return SvgPicture.asset("assets/svg/youtube.svg");
        break;
      case "twitter":
        return SvgPicture.asset("assets/svg/twitter.svg");
        break;
      case "instagram":
        return Image.asset("assets/images/instagram2.png");
        break;
      case "facebook":
        return Image.asset("assets/images/facebook2.png");
        break;
      default:
    }
  }
}
