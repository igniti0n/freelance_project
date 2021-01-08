import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/withdrawal/controllers/withdrawal_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class WithdrawalView extends GetView<WithdrawalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                "Withdrawal Bank",
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
                      "Bank Name",
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownSearch(
                      label: "Access",
                      mode: Mode.MENU,
                      
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Set Social Media";
                        }
                      },
                      items: ["Access", "First Bank", "Fidelity", "FCGM"],
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            textField(
                signup: true,
                name: "Account Name",
                placeholder: "Please Enter Here",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }),
                SizedBox(
              height: 10,
            ),
            textField(
                signup: true,
                name: "Account Number",
                placeholder: "Please Enter Here",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }),
           
            SizedBox(
              height: 30,
            ),
            display_button(
                name: "Update",
                function: () {
                  Get.toNamed(Routes.PERFORMANCE_LIST_REPORT);
                })
          ],
        ));
  }
}
  