import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colours.dart';

show_dialog(
    {BuildContext context,
    String heading,
    String left_text,
    String right_text,
    Function left_text_fn,
    Function right_text_fn,
    Widget widget}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          height: 320,
          width: 369,
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.zero,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    heading,
                    style: GoogleFonts.telex(
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                        color: colour_alert_dialog),
                  ),
                ),
                Container(
                  height: .5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: widget,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 55,
                        child: RaisedButton(
                          onPressed:()=> left_text_fn(),
                          color: colour_border,
                          textColor: Color(0xff010101),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34)),
                          child: Text(left_text,
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 20,
                                  color: Color(0xff010101))),
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        height: 55,
                        child: RaisedButton(
                          onPressed:()=> right_text_fn(),
                          color: colour_black1,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34)),
                          child: Text(
                            right_text,
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      )
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
