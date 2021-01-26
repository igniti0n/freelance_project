// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:progress_dialog/progress_dialog.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:test_project_one/app/data/API/api_calls.dart';
// import 'package:test_project_one/app/data/models/login.dart';
// import 'package:test_project_one/app/routes/app_pages.dart';
// import 'package:test_project_one/app/widgets/colours.dart';

// class BankProvider extends GetConnect {
//   Future<Map<String, dynamic>> getbank(
//     {
      
//     }
//   ) async {
//     final pref = await SharedPreferences.getInstance();

//     String url = BASEURL + PROFILE;
// Map<String, dynamic> body={
//   "account_name": accountName,
//   "account_number":accountNumber,
// }
//     String token = pref.get("token");
//     var response = await get(url, headers: {
//       "Content-Type": "application/json",
//       "Authorization": "Bearer $token"
//     });
//     if (response.hasError) {
//       Get.snackbar(
//         "Error",
//         response.body["message"],
//         duration: Duration(milliseconds: 5000),
//         backgroundColor: colour_time,
//         colorText: Colors.white,
//       );
//       return Future.error(response.statusCode);
//     } else {
//       pref.setString("token", response.body["token"]);
//       String token = pref.get("token");
//       print(token);

//       var res = response.body["data"];

//       Get.snackbar(
//         "Successful",
//         LoginModel().message,
//         duration: Duration(milliseconds: 5000),
//         backgroundColor: colour_time,
//         colorText: Colors.white,
//       );
//       Future.delayed(Duration(milliseconds: 3000), () {
//         Get.offAllNamed(Routes.HOME);
//       });
//       return res;
//     }
//   }
// }
