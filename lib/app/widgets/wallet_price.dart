import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

show_wallet_details({String amount, String type, String date}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: Container(
      decoration: new BoxDecoration(
          color: Color(0xFFFFE3D9), borderRadius: new BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 64,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
                child: Container(
              height: 42,
              width: 42,
              color: Colors.white,
              child: Icon(Icons.keyboard_arrow_down),
            )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(type,
                style:
                    GoogleFonts.telex(fontSize: 15, color: Color(0xff3E3939))),
          ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  // DateFormat('dd MMM yyyy')
                  //     .format(DateTime.parse(transaction.createdAt)),
                  date,
                  style: GoogleFonts.questrial(fontSize: 12, color: Color(0xff919191))
                ),
              )
            ],
          ),
          Spacer(),
           Text(
                amount,
                style: GoogleFonts.questrial(
                    fontSize: 15, color: Color(0xffEA2224)),
              ),
              SizedBox(width: 5,)
         
        ],
      ),
    ),
  );
}
