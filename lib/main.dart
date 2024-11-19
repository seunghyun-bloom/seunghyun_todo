import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seunghyun_todo/app.dart';

void main() async {
  await GetStorage.init();
  runApp(const App());
}
