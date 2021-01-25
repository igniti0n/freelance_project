import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/sign_up_interest/controllers/sign_up_interest_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/alert_dialog.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class SignUpInterestView extends GetView<SignUpInterestController> {
  List<String> interests = [
    "Sports",
    "Aircraft Spotting",
    "Airbrushing",
    "Casino Gambling",
    "BMX",
    "Bird watching",
    "Acting",
    "Bicycle Polo",
    "Bird watching",
    "Canoeing",
    "Cartoning",
    "Birding",
    "Bicycling",
    "Airsofting",
    "Bird watching"
  ];
  List<Widget> list = new List<Widget>();
  List<String> tags = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/interest_list.png"),
          ChipsChoice<String>.multiple(
            spacing: 10,
            value: tags,
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
                    color: Colors.white),
                borderColor: colour_yellow),
            onChanged: (val) => tags = val,
            choiceItems: C2Choice.listFrom<String, String>(
              source: interests,
              value: (i, v) => v,
              label: (i, v) => v,
              tooltip: (i, v) => v,
              // activeStyle: (index, item) => item,
            ),
            wrapped: true,
            textDirection: TextDirection.ltr,
          ),
          SizedBox(
            height: 30,
          ),

          display_button(
              name: "Finish",
              function: () {
    
                show_dialog(
                    context: context,
                    heading: "Account Pending Approval",
                    
                    right_text: "Academy",
                   
                    right_text_fn: () {
                      Get.toNamed(Routes.HOME);
                    },
                    widget: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Kindly complete your course on Gidi Academy to get approved",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Gilroy-Medium",
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ));
              }),
              SizedBox(height: 20,),
        ],
      ),
    ));
  }
}
  