import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/view/counter_view.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'controller/counter_controller.dart';

void main() {
  runApp(const GetMyApp());
}


class GetMyApp extends StatelessWidget {
  const GetMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterView());
  }
}
