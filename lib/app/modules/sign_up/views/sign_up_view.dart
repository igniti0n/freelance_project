import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/exit_dialog.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignUpView extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();
  SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => show_exit_Dialog(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/register_header.png"),
              SizedBox(
                height: 20,
              ),
              textField(
                  signup: true,
                  name: "First Name",
                  placeholder: "Dike",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: true,
                  name: "Last Name",
                  placeholder: "John",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: true,
                  name: "Gender",
                  placeholder: "John",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              Padding(
                  padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
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
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Set Gender";
                          }
                        },
                        items: ["Male", "Female"],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              textField(
                  signup: true,
                  name: "Date of Birth",
                  placeholder: "2020-11-22",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              Padding(
                  padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Religion",
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
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Set Religion";
                          }
                        },
                        items: ["Christianity", "Islamic"],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              textField(
                  signup: true,
                  name: "Highest Education Level",
                  placeholder: "BSc. Computer Science",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              display_button(
                  name: "Next",
                  function: () {
                    Get.toNamed(Routes.SIGN_UP_INTEREST);
                    //          if (_formKey.currentState.validate()) {

                    // }
                  }),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.SIGN_IN);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      color: colour_login_container,
                      fontSize: 13),
                ),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
