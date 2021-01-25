import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colours.dart';
//Define your text fields here

textField({String name, String placeholder, var keyboardType, 
Function validator,bool signup,
TextEditingController controller,

bool password=false}) {

  return Padding(
    padding: const EdgeInsets.only(left: 17.0, right: 17.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         name,
          style: TextStyle(
              fontFamily: "Gilroy", fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextFormField(
            controller: controller,
         
            validator: (value) => validator(value),
            obscureText: password,
            keyboardType: keyboardType,
            decoration: InputDecoration(
            
                hintText: placeholder,
                helperStyle: TextStyle(color:signup==true? colour_black1: colour_text_field_border),
                hintStyle: TextStyle(color: signup==true? Colors.grey: colour_text_field_border),
                labelStyle: TextStyle(color:signup==true? colour_black1: colour_text_field_border),
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: colour_text_field_border)),
                   
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
        SizedBox(height: 20,)
      ],
    ),
  );
}
