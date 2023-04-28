import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/view/counter_view.dart';
import 'package:path_provider/path_provider.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  decrement() => count--;
  Future uploadFile() async {
    var dio = http.Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      final fileName = file.path.split('/').last;
      http.FormData data = http.FormData.fromMap({
        "image": await http.MultipartFile.fromFile(file.path, filename: fileName)
      });
      var response = await dio.post(
          "https://api.imgbb.com/1/upload?expiration=1000&key=11078997d47f56cdda82e5c2233607c9",
          data: data);
      if (response.statusCode == 200) {
        print("Successfully uploaded");
        const encoder = JsonEncoder.withIndent(' ');
        print(encoder.convert(response.data));
      } else {
        print("Failed to upload");
      }
    } else {
      print("Failed to upload");
    }
  }
}
