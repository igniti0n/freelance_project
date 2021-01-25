import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colours.dart';

show_dialog(
    {BuildContext context,
    String heading,
    
    String right_text,
    Function right_text_fn,
    Widget widget}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          height: 320,
          width: Get.width,
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
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: widget,
                ),
                SizedBox(
                  height: 20,
                ),
               
                     
                      SizedBox(
                        
                        height: 55,
                        child: Center(
                          child: Container(
                            width: 100,
                            child: RaisedButton(
                              onPressed:()=> right_text_fn(),
                              color: colour_black1,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34)),
                              child: Center(
                                child: Text(
                                  right_text,
                                  style: TextStyle(
                                      fontFamily: "Gilroy",
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
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
