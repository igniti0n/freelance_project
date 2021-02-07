//ADD YOUR PRIMARY BUTTON
//ADD YOUR SECONDARY BUTTON HERE
import 'package:flutter/material.dart';

import 'colours.dart';

buttonWidget({String name, Function onTap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: colour_black1),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontFamily: "Gilroy",
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
