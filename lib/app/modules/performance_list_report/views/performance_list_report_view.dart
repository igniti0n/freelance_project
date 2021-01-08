import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/performance_list_report/controllers/performance_list_report_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/alert_dialog.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 113,
                    decoration: BoxDecoration(
                        color: colour_black1,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 15,
                          color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 184,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 30,
                            color: Color(0xff939393))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "2020-11-12 13:01",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 20,
                                color: Color(0xff010101)),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: "Gilroy-Regular",
                              fontSize: 12,
                              color: Color(0xff717171)),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20, top: 20),
                      child: Image.asset("assets/images/instagram2.png"),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 184,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 30,
                            color: Color(0xff939393))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "2020-11-12 13:01",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 20,
                                color: Color(0xff010101)),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: "Gilroy-Regular",
                              fontSize: 12,
                              color: Color(0xff717171)),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20, top: 20),
                      child: Image.asset("assets/images/facebook2.png"),)
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ));
  }
}
