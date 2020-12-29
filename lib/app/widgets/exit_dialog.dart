import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colours.dart';

show_exit_Dialog() {
    return Get.defaultDialog(
        title: "Exit!!!!",
        content: Text("Do you want to exist Gidi?"),
        
        onCancel:()=> Get.focusScope,
        cancel: GestureDetector(
          onTap: () => Get.back(),
                  child: Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text("Cancel", style: TextStyle(color: colour_login_container),)),
          ),
        ),
        confirm: GestureDetector(
          onTap: () => exit(0),
                  child: Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              color: colour_login_container,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text("Exit")),
          ),
        ),
        confirmTextColor: colour_text_field_border);
  }