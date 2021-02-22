import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/chat/controllers/chat_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          // GestureDetector(
          //     onTap: () => Get.toNamed(Routes.CHAT),
          //     child: Image.asset("assets/images/notification.png")),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: WebView(
        initialUrl:
            'https://www.tidio.com/talk/0cgcbpa92hbwfyc3fx1rx0ineiouttnm',
        onWebViewCreated: (value) {
          controller.showProgressBar();
        },
        onPageStarted: (value) {
          print("onPageStarted $value");
        },
        onPageFinished: (value) {
          controller.hideProgressBar();
          print("onPageFinished $value");
        },
        onWebResourceError: (error) {
          controller.hideProgressBar();
          controller.showError(message: error.description);
          print("onWebResourceError $error");
        },
      ),
    );
  }
}
