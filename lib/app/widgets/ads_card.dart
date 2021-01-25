import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/routes/app_pages.dart';

import 'colours.dart';

show_card({bool report}) {
  return Column(
    children: [
      
      Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15, top: 10),
        child: Container(
          
          height: 298,
          width: 380,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff939393),
                blurRadius: 10,
                offset: Offset(0, 5)
              )
            ],
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 298,
                width: 8,
                color: colour_yellow,
              ),
              
              Container(
                height: 298,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "G3,500",
                        style: TextStyle(
                          fontFamily: "Gilroy-Medium",
                          fontSize: 14,
                          color: colour_price,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Robotic analyzer launched",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 20,
                              color: colour_ads_header)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                         SvgPicture.asset("assets/svg/small_facebook.svg"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "300",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 12,
                                color: colour_facebook),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset("assets/svg/small_instagram.svg"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "300",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 12,
                                color: colour_instagram),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset("assets/svg/small_youtube.svg"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "300",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 12,
                                color: colour_youtube),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset("assets/svg/small_twitter.svg"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "300",
                            style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 12,
                                color: colour_twitter),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
                          style: TextStyle(
                              fontFamily: "Gilroy-Regular",
                              fontSize: 12,
                              color: colour_alert_dialog),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/small-clock.svg"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("To be completed in",
                              style: TextStyle(
                                  fontFamily: "Gilroy-Regular",
                                  fontSize: 12,
                                  color: Color(0xff949494))),
                          Text(" 10 Days",
                              style: TextStyle(
                                  fontFamily: "Gilroy-Regular",
                                  fontSize: 12,
                                  color: colour_time)),
                          SizedBox(
                            width: 50,
                          ),
                          SvgPicture.asset("assets/svg/small_speaker.svg"),
                          Text("  Image",
                              style: TextStyle(
                                  fontFamily: "Gilroy-Regular",
                                  fontSize: 12,
                                  color: Color(0xff949494))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                       
                        
                        children: [

                          Stack(
                            overflow: Overflow.visible,
                            children: [
                            SvgPicture.asset("assets/svg/facebook.svg"),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: SvgPicture.asset("assets/svg/twitter.svg"),
                            ),
                            Padding(
                               padding: const EdgeInsets.only(left: 30),
                              child: SvgPicture.asset("assets/svg/instagram.svg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: SvgPicture.asset("assets/svg/youtube.svg"),
                            ),
                          ],),
                          SizedBox(
                            width: 20,
                          ),
                          Visibility(
                            visible: report,
                                                      child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.PERFORMANCE_REPORT),
                                    child: Text("Report",
                                  style: TextStyle(
                                      fontFamily: "Gilroy-Medium",
                                      color: colour_yellow,
                                      fontSize: 14)),
                            ),
                          ),
                           SizedBox(
                            width: 30,
                          ), GestureDetector(
                            onTap: () => Get.toNamed(Routes.ADS_DETAILS),
                                                      child: Text("View Details",
                                style: TextStyle(
                                    fontFamily: "Gilroy-Medium",
                                    color: colour_yellow,
                                    fontSize: 14)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
     
    ],
  );
}
