import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up_2/controllers/sign_up_2_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignUp2View extends GetView<SignUp2Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/step_2.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                                      child: Container(
                        decoration: BoxDecoration(color: Color(0xffF679A3)),
                        child: Icon(Icons.arrow_back)),
                  ),
                ),
              ],
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 17.0, right: 17.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Country",
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownSearch(
                      mode: Mode.MENU,
                      label: "Nigeria",
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Set Religion";
                        }
                      },
                      items: ["Nigeria", "Ghana"],
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            textField(
                signup: false,
                name: "Address",
                placeholder: "No 12 Ezikel Street",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }),
            textField(
                signup: true,
                name: "Email",
                placeholder: "Please enter here",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }),
            textField(
                signup: true,
                name: "Password",
                password: true,
                placeholder: "Please enter here",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }),
            display_button(
                name: "Next",
                function: () {
                  Get.toNamed(Routes.SIGN_UP_MEDIA_ACCOUNTS);
                }),
                SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
