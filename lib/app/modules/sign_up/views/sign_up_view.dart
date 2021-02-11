import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:test_project_one/app/modules/sign_up/views/sign_up_2_view.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/exit_dialog.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignUpView extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();
  SignUpController _controller = Get.put(SignUpController());

  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  String gender;
  String religion;

  // String date = "${controller.currentDate.value.toIso8601String()}";
  TextEditingController levelOfEducation = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController dOB;

    return WillPopScope(
      onWillPop: () => showExitDialog(),
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
                  controller: firstname,
                  name: "First Name",
                  placeholder: "Jide",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: true,
                  controller: lastname,
                  name: "Last Name",
                  placeholder: "Afam",
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
                        label: _controller.gender.value.isEmpty
                            ? null
                            : _controller.gender.value,
                        hint: 'Select Gender',
                        maxHeight: 100,
                        mode: Mode.MENU,
                        onChanged: (value) {
                          _controller.gender.value = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Set Gender";
                          }
                          return null;
                        },
                        items: ["Male", "Female"],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of Birth",
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        height: 60,
                        width: Get.width,
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Obx(() => TextFormField(
                                    controller: dOB = TextEditingController(
                                        text: controller.dOB.value
                                            .toString()
                                            .substring(0, 10)),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: GestureDetector(
                                            onTap: () {
                                              _controller
                                                  .selectDate(Get.context);
                                            },
                                            child: Icon(Icons
                                                .calendar_today_outlined))),
                                    readOnly: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Can't be empty";
                                      }
                                      return null;
                                    },
                                  ))),
                        )),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
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
                        maxHeight: 100,
                        hint: 'Select Religion',
                        label: _controller.religion.value.isEmpty
                            ? null
                            : _controller.religion.value,
                        mode: Mode.MENU,
                        onChanged: (value) {
                          _controller.religion.value = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Set Religion";
                          }
                          return null;
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
                  controller: levelOfEducation,
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
              buttonWidget(
                  name: "Next",
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      Get.to(SignUp2View(
                        firstName: firstname.text,
                        lastname: lastname.text,
                        gender: _controller.gender.value,
                        dOB: dOB.text,
                        religion: _controller.religion.value,
                        levelOfEducation: levelOfEducation.text,
                      ));
                    }
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
