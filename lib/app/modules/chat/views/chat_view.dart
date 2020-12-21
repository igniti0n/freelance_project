import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/chat/controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChatView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  