import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/home/controllers/dialogcontroller_controller.dart';
import 'package:test_project_one/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(()=> Text(controller.count.value.toString())),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          controller.increment();
        },child: Text("Add"),),
      ),
    );
  }
}
  