import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seunghyun_todo/routes/setting/setting_route_controller.dart';

class SettingRoute extends StatelessWidget {
  const SettingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: SettingRouteController(),
        builder: (controller) {
          return const Center(
            child: Text('셋팅'),
          );
        },
      ),
    );
  }
}
