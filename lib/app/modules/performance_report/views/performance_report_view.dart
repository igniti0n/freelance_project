import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/performance_report/controllers/performance_report_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class PerformanceReportView extends GetView<PerformanceReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Social Media Performance Report",
                style: TextStyle(
                  fontFamily: "Gilroy-Light",
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 17, right: 17, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Social Media",
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownSearch(
                      label: "Facebook",
                      mode: Mode.MENU,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Set Social Media";
                        }
                      },
                      items: ["Facebook", "Twitter", "Youtube", "Instagram"],
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            textField(
                signup: true,
                name: "Date Collected",
                placeholder: "Please Enter Here",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 55,
                width: 169,
                decoration: BoxDecoration(
                    color: colour_border,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Attach File",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        color: Color(0xff010101)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            display_button(
                name: "Submit",
                function: () {
                  Get.toNamed(Routes.PERFORMANCE_LIST_REPORT);
                })
          ],
        ));
  }
}
