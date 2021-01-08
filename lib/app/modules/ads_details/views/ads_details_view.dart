import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/ads_details/controllers/ads_details_controller.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class AdsDetailsView extends GetView<AdsDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Image.asset("assets/images/banner.png"),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "12 Dec, 2020",
                      style: TextStyle(
                          fontFamily: "Gilroy-Regular",
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 20, left: 20),
                    child: Text(
                      "Robotic analyzer launched",
                      style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset("assets/images/facebook.png"),
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
                  Image.asset("assets/images/instagram.png"),
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
                  Image.asset("assets/images/youtube.png"),
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
                  Image.asset("assets/images/twitter.png"),
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
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 240,
                width: 388,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset("assets/images/duration.png"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deadline",
                          style: TextStyle(
                              color: Color(0xff500A84),
                              fontFamily: "Gilroy",
                              fontSize: 14),
                        ),
                        Row(
                          children: [
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
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/images/ads_type.png"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ads Type",
                          style: TextStyle(
                              color: colour_yellow,
                              fontFamily: "Gilroy",
                              fontSize: 14),
                        ),
                        Text("Image",
                            style: TextStyle(
                                fontFamily: "Gilroy-Regular",
                                fontSize: 12,
                                color: colour_time)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 176,
              width: 414,
              color: Color(0xffF9F9F9),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.download_outlined,
                          color: colour_yellow,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Downloads",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 16,
                              color: colour_yellow),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Banner 1024*1024",
                                    style: TextStyle(
                                        color: Color(0xff282828),
                                        fontFamily: "Gilroy-Medium",
                                        fontSize: 14,
                                        decoration: TextDecoration.underline),
                                  ),
                                  Text(
                                    "https://web.whatsapp.com/",
                                    style: TextStyle(
                                        color: colour_twitter,
                                        fontFamily: "Gilroy-Medium",
                                        fontSize: 14,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Icon(Icons.copy_outlined)
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Banner 1024*1024",
                                    style: TextStyle(
                                        color: Color(0xff282828),
                                        fontFamily: "Gilroy-Medium",
                                        fontSize: 14,
                                        decoration: TextDecoration.underline),
                                  ),
                                  Text(
                                    "https://web.whatsapp.com/",
                                    style: TextStyle(
                                        color: colour_twitter,
                                        fontFamily: "Gilroy-Medium",
                                        fontSize: 14,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Icon(Icons.copy_outlined)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: Text(
              "G3,500",
              style: TextStyle(
                  fontFamily: "Gilroy-Medium",
                  fontSize: 26,
                  color: Colors.black),
            )),
            SizedBox(height: 10,),
            display_button(name: "Accept"),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
