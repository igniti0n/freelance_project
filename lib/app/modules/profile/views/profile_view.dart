import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/profile/controllers/profile_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class ProfileView extends GetView<ProfileController> {
  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  String religion;
  TextEditingController education = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController facebook = new TextEditingController();
  TextEditingController twitter = new TextEditingController();
  TextEditingController instagram = new TextEditingController();
  TextEditingController youtube = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: controller.obx((data) =>
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
                              controller: firstname,
                              name: "First Name",
                              placeholder:
                                  data == null ? "Dike" : data[0]["firstname"],
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
                              placeholder:
                                  data == null ? "John" : data[0]["lastname"],
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          textField(
                              signup: true,
                              controller: phone,
                              name: "Phone",
                              placeholder:
                                  data == null ? "phone" : data[0]["phone"],
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 17.0, right: 17.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 17.0, right: 17.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            onChanged: (value) {
                                              religion = value;
                                            },
                                            label: data == null
                                                ? "Christianity"
                                                : data[0]["religion"],
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
                                      controller: education,
                                      name: "Highest Education Level",
                                      placeholder: data == null
                                          ? "BSc. Computer Science"
                                          : data[0]["level_of_education"],
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Fill Field";
                                        }
                                      }),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 17.0, right: 17.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            label: data == null
                                                ? "Nigeria"
                                                : data[0]["country"],
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
                                      controller: address,
                                      name: "Address",
                                      placeholder: data == null
                                          ? "12 Ezekiel Street"
                                          : data[0]["address"],
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
                                      controller: facebook,
                                      name: "Facebook",
                                      placeholder: data[0]["facebook"] == null
                                          ? "Facebook"
                                          : data[0]["facebook"],
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Fill Field";
                                        }
                                      }),
                                  textField(
                                      signup: true,
                                      name: "Twitter",
                                      controller: twitter,
                                      placeholder: data[0]["twitter"] == null
                                          ? "Please Enter Here"
                                          : data[0]["twitter"],
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Fill Field";
                                        }
                                      }),
                                  textField(
                                      signup: true,
                                      controller: instagram,
                                      name: "Instagram",
                                      placeholder: data[0]["instagram"] == null
                                          ? "Please Enter Here"
                                          : data[0]["instagram"],
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Fill Field";
                                        }
                                      }),
                                  textField(
                                      signup: true,
                                      name: "Youtube",
                                      controller: youtube,
                                      placeholder: data[0]["youtube"] == null
                                          ? "Please Enter Here"
                                          : data[0]["youtube"],
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
                                        controller.updateProfile(
                                          firstname: firstname.text ??
                                              data[0]["firstname"],
                                          lastname: lastname.text ??
                                              data[0]["lastname"],
                                          phone: phone.text ?? data[0]["phone"],
                                          religion:
                                              religion ?? data[0]["religion"],
                                          education: education.text ??
                                              data[0]["level_of_education"],
                                          country: country.text ??
                                              data[0]["country"],
                                          address: address.text ??
                                              data[0]["address"],
                                          facebook: facebook.text ??
                                              data[0]["facebook"],
                                          twitter: twitter.text ??
                                              data[0]["twitter"],
                                          instagram: instagram.text ??
                                              data[0]["instagram"],
                                          youtube: youtube.text ??
                                              data[0]["youtube"],
                                        );
                                      }),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ))
                        ]),
                  )
                ]))));
  }
}
