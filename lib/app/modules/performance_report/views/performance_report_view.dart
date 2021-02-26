import 'dart:io';

import 'package:path/path.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/performance_report/controllers/performance_report_controller.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';
import 'package:intl/intl.dart';

class PerformanceReportView extends GetView<PerformanceReportController> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descController;
  final controller = Get.put(PerformanceReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
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
                        // label: "Facebook",
                        onChanged: (value) {
                          print(value);
                          controller.setSocialMedia(value);
                        },
                        hint: 'Select Social Media',
                        mode: Mode.MENU,
                        validator: (value) {
                          if (value == null) {
                            return "Set Social Media";
                          } else {
                            return null;
                          }
                        },
                        items: ["Facebook", "Twitter", "Youtube", "Instagram"],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return textField(
                      controller: descController = new TextEditingController(
                          text: controller.selectedDate.value),
                      signup: true,
                      focusNode: AlwaysDisabledFocusNode(),
                      name: "Date Collected",
                      placeholder: "Select Date here",
                      keyboardType: TextInputType.name,
                      onTapped: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019, 1),
                            lastDate: DateTime(2021, 12),
                            builder: (BuildContext context, Widget picker) {
                              return Theme(
                                //TODO: change colors
                                data: ThemeData.light().copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Colors.orange[800],
                                      onPrimary: Colors.white,
                                      surface: Colors.pink,
                                      onSurface: Colors.black,
                                    ),
                                    dialogBackgroundColor: Colors.white),
                                child: picker,
                              );
                            }).then((selectedDate) {
                          //TODO: handle selected date
                          if (selectedDate != null) {
                            var formatter = DateFormat('yyyy-MM-dd');
                            controller.selectedDate.value =
                                formatter.format(selectedDate);
                          }
                        });
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Please select Date";
                        }
                      });
                }),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      controller.openFilePicker();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                        Obx(() {
                          File file = controller.file.value;
                          return file.path.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(basename(file.path)),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          controller.file.value = new File('');
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : Container();
                        })
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                buttonWidget(
                    name: "Submit",
                    onTap: () {
                      print("Validating");
                      if (_formKey.currentState.validate()) {
                        if (controller.file.value.path.isNotEmpty) {
                          controller.postReport(desc: descController.text);
                        } else {
                          Get.snackbar(
                            Strings.ERROR,
                            'Please attach file to report',
                            duration: Duration(milliseconds: 2000),
                            backgroundColor: colour_time,
                            colorText: Colors.white,
                          );
                        }
                      }
                    })
              ],
            ),
          ),
        ));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
