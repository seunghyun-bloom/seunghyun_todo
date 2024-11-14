import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseNavigator {
  static Future pushNamed(String path) {
    return Get.toNamed(path)!;
  }

  static Future push(Widget route, {String? routeName}) {
    String name = '/${routeName ?? route.runtimeType.toString()}';
    return Get.to(
      () => route,
      routeName: name,
    )!;
  }

  static Future presentFade(Widget route, {String? routeName, Color? baseColor}) {
    String name = '/${routeName ?? route.runtimeType.toString()}';
    return Get.to(
      () => route,
      routeName: name,
      fullscreenDialog: true,
      transition: Transition.fadeIn,
    )!;
  }

  static Future present(Widget route, {String? routeName, Color? baseColor}) {
    String name = '/${routeName ?? route.runtimeType.toString()}';
    return Get.to(
      () => route,
      routeName: name,
      duration: const Duration(milliseconds: 400),
      fullscreenDialog: true,
    )!;
  }

  static Future reset(Widget route, {String? routeName}) {
    return Get.offAll(
      () => route,
      routeName: routeName ?? route.runtimeType.toString(),
      fullscreenDialog: true,
      duration: const Duration(seconds: 0),
    )!;
  }

  static Future bottomSheet(Widget route, {String? routeName}) {
    return showModalBottomSheet(
      elevation: 0,
      context: Get.context!,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: false,
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Container(
            color: Colors.white,
            height: Get.mediaQuery.size.height - 150,
            child: SafeArea(
              child: route,
            ),
          ),
        );
      },
    );
  }

  static void pop([var result]) {
    Get.back(result: result);
  }

  static void popToRoot([var result]) {
    Get.until((route) => route.isFirst);
  }
}
