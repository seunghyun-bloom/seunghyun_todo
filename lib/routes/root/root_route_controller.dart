import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seunghyun_todo/routes/setting/setting_route.dart';
import 'package:seunghyun_todo/routes/todo/todo_route.dart';

class RootRouteController extends GetxController {
  // ! ---- core ----

  initialize() {}

  @override
  void onInit() {
    super.onInit();
  }

  // ! ---- Routing ----
  int navIndex = 0;

  List<Widget> routes = const [
    TodoRoute(),
    SettingRoute(),
  ];

  setIndex(int index) {
    navIndex = index;
    update();
  }
}
