import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

import 'colours.dart';

showPopupDialogWithTextField(
    {BuildContext context,
    String heading,
    String subTitle,
    String hintText,
    String leftButtonTitle,
    bool isPasswordEntry = false,
    Function onPressedLeftButton,
    String rightButtonTitle,
    Function(String) onPressedRightButton,
    dynamic keyboardType}) {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = new TextEditingController();
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Container(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    heading,
                    style: GoogleFonts.telex(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: colour_alert_dialog),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: .5,
                  color: Colors.grey,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                //   child: Text(
                //     subTitle,
                //     style: TextStyle(
                //         fontFamily: "Gilroy",
                //         fontSize: 15,
                //         color: Colors.black),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: textField(
                        controller: passwordController,
                        name: subTitle,
                        placeholder: hintText,
                        password: isPasswordEntry,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Fill this field";
                          }
                        },
                        keyboardType:
                            keyboardType ?? TextInputType.visiblePassword),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: buttonWidget(
                          name: leftButtonTitle,
                          onTap: onPressedLeftButton,
                          bgColor: Colors.grey[300],
                          textColor: Colors.black,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: buttonWidget(
                          name: rightButtonTitle,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState.validate()) {
                              onPressedRightButton(passwordController.text);
                            }
                          },
                          bgColor: colour_black1,
                          textColor: Colors.white,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      });
}
