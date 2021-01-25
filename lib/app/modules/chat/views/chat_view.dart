import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/chat/controllers/chat_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/ads_card.dart';
import 'package:test_project_one/app/widgets/header.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/pics.png"),
            ),
            SizedBox(
              width: 14,
            ),
            Text(
              "John",
              style: TextStyle(fontFamily: "Gilroy"),
            )
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () => Get.toNamed(Routes.CHAT),
              child: Image.asset("assets/images/notification.png")),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Spacer(),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),
              Container(
                height: 59,
                width: 216,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Color(0xff010101)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/file.png"),
                        ),
                        Text(
                          "payment_receipt.pdf",
                          style: TextStyle(
                              fontFamily: "Gilroy-Medium",
                              fontSize: 15,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          "Nov 7, 09:18",
                          style: TextStyle(
                              fontFamily: "Gilroy-Medium",
                              fontSize: 10,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 59,
                  width: 176,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Color(0xff282828)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Thanks",
                              style: TextStyle(
                                  fontFamily: "Gilroy-Medium",
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "Nov 7, 09:18",
                            style: TextStyle(
                                fontFamily: "Gilroy-Medium",
                                fontSize: 10,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 89,
              width: 323,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Color(0xffFFD181)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "Where are you going?",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: "Gilroy-Medium",
                                fontSize: 14,
                                color: Color(0xff3B113D)),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "Nov 7, 09:18",
                        style: TextStyle(
                            fontFamily: "Gilroy-Medium",
                            fontSize: 10,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 74,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(offset: Offset(0, -1),
                blurRadius: 5,
                color: Colors.grey)]),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset("assets/svg/attach.svg"),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 47,
                  width: Get.width *0.7,
                  decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      border: Border.all(color: Color(0xffDEDEDE)),
                      borderRadius: BorderRadius.circular(14)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write your message…",
                        hintStyle: TextStyle(
                            fontFamily: "Gilroy-Medium",
                            fontSize: 16,
                            color: Color(0xffA4A4A4))),
                  ),
                ),
                 SvgPicture.asset("assets/svg/send.svg", height: 32, width: 32,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
