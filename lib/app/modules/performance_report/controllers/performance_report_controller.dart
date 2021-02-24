import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/fileUploadModel.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/data/models/performanceReportModel.dart';
import 'package:test_project_one/app/modules/performance_report/provider/performance_report_provider.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class PerformanceReportController extends GetxController {
  //TODO: Implement PerformanceReportController
  var file = new File("").obs;
  String _socialMedia = "";
  AdsDetailModel adsDetailModel;

  @override
  void onInit() {
    adsDetailModel = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setSocialMedia(String value) {
    _socialMedia = value;
  }

  openFilePicker() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file.value = File(result.files.single.path);
      Get.snackbar(
        Strings.SUCCESS,
        Strings.FILE_ATTACHED,
        duration: Duration(milliseconds: 2000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      // change(this.state, status: RxStatus.success());
    } else {
      // User canceled the picker
    }
  }

  Future<FileUploadModel> uploadFileToServer() async {
    try {
      PerformanceReportProvider provider = PerformanceReportProvider();
      return await provider.uploadFileToServer(file.value);
    } catch (onError) {
      Get.snackbar(
        Strings.ERROR,
        onError.message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return null;
    }
  }

  postReport({String desc}) async {
    Map<String, String> params = {
      DESC_PARAM: desc,
      SOCIAL_MEDIA_PARAM: _socialMedia.toLowerCase(),
      AD_ID_PARAM: adsDetailModel.id,
    };

    if (file != null) {
      FileUploadModel fileUploadModel = await uploadFileToServer();
      params[ATTACH_PARAM] = fileUploadModel.fileUrl;
    }

    try {
      PerformanceReportProvider provider = PerformanceReportProvider();
      PerformanceReportModel model = await provider.postReport(params: params);
      Get.snackbar(Strings.SUCCESS, model.message ?? Strings.SOMETHING_WRONG,
          duration: Duration(milliseconds: 1000),
          backgroundColor: colour_time,
          colorText: Colors.white, snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          Get.back(result: true);
        }
      }, onTap: (obj) {
        Get.back(result: true);
      });
    } catch (onError) {
      Get.snackbar(
        Strings.ERROR,
        onError.message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
    }
  }
}
