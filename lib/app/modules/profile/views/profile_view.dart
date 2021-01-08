import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/profile/controllers/profile_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    fontFamily: "Gilroy-Light",
                    fontSize: 22,
                  ),
                )),
            Center(
                child: Stack(
              children: [
                Image.asset("assets/images/pic1.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Image.asset("assets/images/mask.png"),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
            Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              label: "Male",
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
                              label: "Christianity",
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
                    Padding(
                        padding: const EdgeInsets.only(left: 17.0, right: 17.0),
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
                    textField(
                        signup: true,
                        name: "Address",
                        placeholder: "12 Ezekiel Street",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Fill Field";
                          }
                        }),
                    Center(
                      child: Text(
                        "Social Media Accounts",
                        style: TextStyle(
                            fontFamily: "Gilroy-Regular",
                            fontSize: 18,
                            color: Color(0xff282828)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                     textField(
                        signup: true,
                        name: "Facebook",
                        placeholder: "Please Enter Here",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Fill Field";
                          }
                        }),
                        textField(
                        signup: true,
                        name: "Twitter",
                        placeholder: "Please Enter Here",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Fill Field";
                          }
                        }),
                        textField(
                        signup: true,
                        name: "Instagram",
                        placeholder: "Please Enter Here",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Fill Field";
                          }
                        }),
                        textField(
                        signup: true,
                        name: "Youtube",
                        placeholder: "Please Enter Here",
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
                        name: "Update",
                        function: () {
                          Get.toNamed(Routes.PERFORMANCE_LIST_REPORT);
                        }),
                         SizedBox(
                      height: 30,
                    ),
                  ],
                ))
          ]),
        ));
  }
}
