import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/router/base_navigator.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';
import 'package:seunghyun_todo/routes/splash/splash_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MaterialHomeRoute(),
      theme: AppTheme.themeData(context),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: FlutterEasyLoading(child: child),
        );
      },
    );
  }
}

class MaterialHomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.25),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    BaseNavigator.reset(const SplashRoute());
  }
}

class MaterialHomeRoute extends StatelessWidget {
  const MaterialHomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MaterialHomeController());
    return Scaffold(
      body: Container(),
    );
  }
}
