import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get_connect/connect.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/fileUploadModel.dart';
import 'package:test_project_one/app/data/models/performanceReportModel.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/main.dart';

class PerformanceReportProvider extends GetConnect {
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

  Future<PerformanceReportModel> postReport(
      {Map<String, String> params}) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    ProgressDialog progressDialog = createProgressDialog();
    progressDialog.show();

    String url = BASEURL + POST_REPORT;

    var response = await post(url, params, headers: {
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
      PerformanceReportModel model = PerformanceReportModel.fromJson(res);
      return model;
    }
  }
}
