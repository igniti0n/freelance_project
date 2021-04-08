import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'colours.dart';

showNotificationCard(
    {String title,
    String description,
    Color sideColor,
    Function() onTap,
    List<TextSpan> descriptionSpans}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 12),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  color: sideColor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 20,
                            color: colour_ads_header),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: description,
                          children: descriptionSpans,
                          style: TextStyle(
                              fontFamily: "Gilroy-Regular",
                              fontSize: 12,
                              color: colour_alert_dialog),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
