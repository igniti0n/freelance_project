//ADD YOUR PRIMARY BUTTON
//ADD YOUR SECONDARY BUTTON HERE
import 'package:flutter/material.dart';

import 'colours.dart';

buttonWidget(
    {String name,
    Function onTap,
    Color bgColor,
    Color textColor,
    EdgeInsets padding}) {
  return Padding(
    padding: padding ?? EdgeInsets.only(left: 20, right: 20),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: bgColor ?? colour_black1),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontFamily: "Gilroy",
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
