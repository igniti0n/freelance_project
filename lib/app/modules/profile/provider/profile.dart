import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/fileUploadModel.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/data/models/profileModel.dart';
import 'package:test_project_one/app/data/models/profileUpdateModel.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/main.dart';

class ProfileProvider extends GetConnect {
  Future<ProfileDetailModel> getProfile() async {
    String url = BASEURL + PROFILE;
    var response = await get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + loginModel.token
    });

    if (response.hasError) {
      return Future.error(response.statusCode);
    } else {
      var res = response.body;
      ProfileModel profileModel = ProfileModel.fromJson(res);
      return profileModel.data.first;
    }
  }

  Future<User> updateProfile({Map params}) async {
    ProgressDialog pr = createProgressDialog();
    String url = BASEURL + PROFILE;
    pr.show();
    var response = await request(url, "PATCH", body: params, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + loginModel.token
    });

    pr.hide();

    if (response.hasError) {
      Get.snackbar(
        "Error",
        "Error Occured",
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return Future.error(response.statusCode);
    } else {
      var result = response.body;
      ProfileUpdateModel profileUpdateModel =
          ProfileUpdateModel.fromJson(result);
      Get.snackbar(
        "Successful",
        result['message'] ?? "Profile updated",
        duration: Duration(milliseconds: 3000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return profileUpdateModel.data;
    }
  }

  Future<FileUploadModel> uploadFileToServer(File file) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    ProgressDialog progressDialog = createProgressDialog();
    progressDialog.show();

    String url = BASEURL + FILE_UPLOAD;
    Uint8List fileData = await file.readAsBytes();
    final form = FormData({
      'file':
          MultipartFile(fileData.cast<int>(), filename: basename(file.path)),
    });
    var response = await post(url, form, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    progressDialog.hide();
    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = response.body;
      FileUploadModel fileUploadModel = FileUploadModel.fromJson(res);
      return fileUploadModel;
    }
  }

  // Future<String> updatePhoto({File image}) async {

  //   final pref = await SharedPreferences.getInstance();
  //   ProgressDialog pr;
  //   BuildContext context = Get.context;
  //   pr = new ProgressDialog(
  //     context,
  //     showLogs: true,
  //     isDismissible: false,
  //   );
  //   pr.style(
  //       progressWidget: Container(
  //         width: 50,
  //         child: Center(
  //           child: CircularProgressIndicator(),
  //         ),
  //       ),
  //       message: 'Please wait...');
  //   pr.show();

  //   //  final multiPartRequst = MultipartFile(
  //   //   image.path.toString(),
  //   //   filename: image.path.split("/").last,
  //   // );
  //   // final formdata = FormData({"file": multiPartRequst});
  //   String url = BASEURL + PROFILE;
  //   String token = pref.get("token");
  //   var response = await put(url, formdata?, headers: {
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer $token"
  //   });
  //   if (response.hasError) {
  //     pr.hide();
  //     Get.snackbar(
  //       "Error",
  //       "Error Occured",
  //       duration: Duration(milliseconds: 5000),
  //       backgroundColor: colour_time,
  //       colorText: Colors.white,
  //     );
  //     return Future.error(response.statusCode);
  //   } else {
  //     pr.hide();
  //     var res = response.body["data"];
  //     final result = ProfileModel.fromJson(res);
  //     Get.snackbar(
  //       "Successful",
  //       LoginModel().message,
  //       duration: Duration(milliseconds: 5000),
  //       backgroundColor: colour_time,
  //       colorText: Colors.white,
  //     );

  //     return res;
  //   }
  // }
}
