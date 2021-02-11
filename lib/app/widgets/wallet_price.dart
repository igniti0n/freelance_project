import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

transactionDetailCard({String amount, String type, String date}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: new BoxDecoration(
          color: Color(0xFFFCCDA3), borderRadius: new BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 16),
      // height: 55,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(type,
                  style: GoogleFonts.telex(
                      fontSize: 16, color: Color(0xff3E3939))),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                    // DateFormat('dd MMM yyyy')
                    //     .format(DateTime.parse(transaction.createdAt)),
                    date,
                    style: GoogleFonts.questrial(
                        fontSize: 12, color: Color(0xff919191))),
              )
            ],
          ),
          Spacer(),
          Text(
            amount,
            style: GoogleFonts.questrial(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
