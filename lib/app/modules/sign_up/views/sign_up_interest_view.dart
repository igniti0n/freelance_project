import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up/controllers/signUpInterest.dart';
import 'package:test_project_one/app/widgets/alert_dialog.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpInterestView extends GetView<SignUpInterestController> {
  final SignUpInterestController controller =
      Get.put(SignUpInterestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildInterestView(context),
    );
  }

  _buildInterestView(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/interest_list.png"),
          controller.obx(
            (state) => buildInterestTagsView(),
            onLoading: Container(),
            onError: (error) {
              return ErrorView(
                errorMsg: error,
                onTapReload: () {
                  controller.fetchInterests();
                },
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          controller.obx(
            (state) => buildNextButton(context),
            onLoading: Loader(),
            onError: (error) {
              return Container();
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }

  buildNextButton(BuildContext context) {
    return buttonWidget(
        name: "Finish",
        onTap: () async {
          var isSuccess = await controller.postInterests();
          if (isSuccess) {
            showAccountPendingDialog(context);
          }
        });
  }

  buildInterestTagsView() {
    return controller.intersts.length > 0
        ? ChipsChoice<String>.multiple(
            spacing: 10,
            value: controller.selectedTags.cast<String>(),
            runSpacing: 10,
            choiceStyle: C2ChoiceStyle(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                labelStyle: TextStyle(
                    fontFamily: "Gilroy-Medium",
                    fontSize: 13,
                    color: Colors.black),
                borderColor: colour_border),
            padding: EdgeInsets.only(top: 40, bottom: 10, right: 10, left: 10),
            choiceActiveStyle: C2ChoiceStyle(
                color: colour_yellow,
                labelStyle: TextStyle(
                    fontFamily: "Gilroy-Medium",
                    fontSize: 13,
                    color: Colors.black),
                borderColor: colour_yellow),
            onChanged: (val) {
              controller.setSelectedTags(tags: val);
            },
            choiceItems: C2Choice.listFrom<String, String>(
              source: controller.intersts
                  .map((e) => e.interest)
                  .toList()
                  .cast<String>(),
              value: (i, v) => v,
              label: (i, v) => v,
              tooltip: (i, v) => v,
              // activeStyle: (index, item) => item,
            ),
            wrapped: true,
            textDirection: TextDirection.ltr,
          )
        : Container();
  }

  showAccountPendingDialog(BuildContext context) {
    show_dialog(
        context: context,
        heading: "Account Pending Approval",
        right_text: "Academy",
        right_text_fn: () {
          launch('http://vuemastery.com/');
        },
        widget: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "Kindly complete your course on Gidi Academy to get approved",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Gilroy-Medium", fontSize: 20, color: Colors.black),
          ),
        ));
  }
}
