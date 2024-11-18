import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:seunghyun_todo/infra/components/core/custom_buttons.dart';
import 'package:seunghyun_todo/infra/router/base_navigator.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';

enum DialogType { basic, native, bottomSheet }

class BaseDialog {
  static Future<bool> showCheck({
    String? title,
    String? description,
    String? buttonLabel,
    DialogType? type = DialogType.basic,
  }) {
    return Future.value().then((value) {
      if (type == DialogType.native) {
        return _showNative(
          title: title,
          description: description,
          buttonLabels: [buttonLabel ?? '확인'],
        );
      } else if (type == DialogType.bottomSheet) {
        return _showBottomSheet(
          title: title,
          description: description ?? '',
          buttonLabels: [buttonLabel ?? '확인'],
        );
      } else {
        return _showMessage(
          title: title,
          description: description ?? '',
          buttonLabels: [buttonLabel ?? '확인'],
        );
      }
    }).then((value) {
      if (value == true) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    });
  }

  static Future<bool> showConfirm({
    String? title,
    required String description,
    String? cancelLabel,
    String? confirmLabel,
    Color? confirmColor,
    Color? confirmTextColor,
    bool? native = false,
    DialogType? type = DialogType.basic,
  }) {
    return Future.value().then((value) {
      if (type == DialogType.native) {
        return _showNative(
          title: title,
          description: description,
          buttonLabels: [cancelLabel ?? '취소', confirmLabel ?? '확인'],
        );
      } else if (type == DialogType.bottomSheet) {
        return _showBottomSheet(
          title: title,
          description: description,
          buttonLabels: [cancelLabel ?? '취소', confirmLabel ?? '확인'],
        );
      } else {
        return _showMessage(
          title: title,
          description: description,
          buttonLabels: [cancelLabel ?? '취소', confirmLabel ?? '확인'],
          secondButtonColor: confirmColor,
          secondButtonTextColor: confirmTextColor,
        );
      }
    }).then((value) {
      if (value == true) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    });
  }

  static Future showToast(message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black87,
      fontSize: 16.0,
    );
  }

  static showCaution(message) {
    Get.rawSnackbar(
      icon: Icon(
        Icons.info_outline,
        color: AppTheme.colors.red,
      ),
      padding: const EdgeInsets.fromLTRB(20, 18, 18, 18),
      duration: const Duration(seconds: 2),
      backgroundColor: AppTheme.colors.black.withOpacity(0.6),
      snackPosition: SnackPosition.BOTTOM,
      shouldIconPulse: false,
      messageText: Text(
        message,
        style: AppTheme.textStyles.semibold16White,
      ),
      borderRadius: 16,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
    );
  }

  // ? ---- Internal ----

  static Future _showMessage({
    String? title,
    required String description,
    required List<String> buttonLabels,
    Color? secondButtonColor,
    Color? secondButtonTextColor,
  }) {
    List<Widget> buttons = [];
    if (buttonLabels.length == 1) {
      ElevatedButton button = ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppTheme.colors.black),
          foregroundColor: WidgetStatePropertyAll(AppTheme.colors.white),
          overlayColor: WidgetStatePropertyAll(AppTheme.colors.white.withOpacity(0.1)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(buttonLabels.first),
        onPressed: () => BaseNavigator.pop(true),
      );
      buttons.add(Expanded(child: button));
    } else {
      for (int i = 0; i < 2; i++) {
        ElevatedButton button = ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              i == 0 ? AppTheme.colors.lightGray : secondButtonColor ?? AppTheme.colors.black,
            ),
            foregroundColor: WidgetStatePropertyAll(
              i == 0 ? AppTheme.colors.gray : secondButtonTextColor ?? Colors.white,
            ),
            overlayColor: WidgetStatePropertyAll(
              i == 0 ? AppTheme.colors.black.withOpacity(0.1) : AppTheme.colors.white.withOpacity(0.1),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: Text(buttonLabels[i]),
          onPressed: () => BaseNavigator.pop(i == 1),
        );
        buttons.add(
          Expanded(child: button),
        );
        if (i == 0) {
          buttons.add(const SizedBox(width: 8));
        }
      }
    }

    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(builder: (ctx) {
                if (title == null) {
                  return const SizedBox(height: 34);
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      title,
                      style: AppTheme.textStyles.semibold24,
                    ),
                  );
                }
              }),
              Text(
                description,
                style: AppTheme.textStyles.regular14Gray,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: title == null ? 36 : 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttons,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future _showNative({
    String? title,
    String? description,
    required List<String> buttonLabels,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (ctx) {
          List<Widget> buttons = [];
          if (buttonLabels.length == 1) {
            CupertinoDialogAction button = CupertinoDialogAction(
              child: Text(buttonLabels.first),
              onPressed: () {
                BaseNavigator.pop(true);
              },
            );
            buttons.add(button);
          } else {
            for (int i = 0; i < 2; i++) {
              CupertinoDialogAction button = CupertinoDialogAction(
                child: Text(buttonLabels[i]),
                onPressed: () {
                  BaseNavigator.pop(i == 1);
                },
              );
              buttons.add(button);
            }
          }
          return CupertinoAlertDialog(
            title: title != null ? Text(title) : null,
            content: description != null ? Text(description) : null,
            actions: buttons,
          );
        },
      );
    } else {
      return showGeneralDialog(
        context: Get.context!,
        barrierDismissible: true,
        barrierLabel: 'close',
        pageBuilder: (context, animation, secondaryAnimation) {
          List<Widget> buttons = [];
          if (buttonLabels.length == 1) {
            TextButton button = TextButton(
              child: Text(buttonLabels.first),
              onPressed: () {
                BaseNavigator.pop(true);
              },
            );
            buttons.add(button);
          } else {
            for (int i = 0; i < 2; i++) {
              TextButton button = TextButton(
                child: Text(buttonLabels[i]),
                onPressed: () {
                  BaseNavigator.pop(i == 1);
                },
              );
              buttons.add(button);
            }
          }
          return AlertDialog(
            title: title != null ? Text(title) : null,
            content: description != null ? Text(description) : null,
            actions: buttons,
          );
        },
      );
    }
  }

  static Future _showBottomSheet({
    String? title,
    required String description,
    required List<String> buttonLabels,
    Color? secondButtonColor,
    Color? secondButtonTextColor,
  }) {
    List<Widget> buttons = [];
    if (buttonLabels.length == 1) {
      ElevatedButton button = ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(
              vertical: 12,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(AppTheme.colors.black),
          foregroundColor: WidgetStatePropertyAll(AppTheme.colors.white),
          overlayColor: WidgetStatePropertyAll(AppTheme.colors.white.withOpacity(0.1)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(buttonLabels.first),
        onPressed: () => BaseNavigator.pop(true),
      );
      buttons.add(Expanded(child: button));
    } else {
      for (int i = 0; i < 2; i++) {
        ElevatedButton button = ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              i == 0 ? AppTheme.colors.lightGray : secondButtonColor ?? AppTheme.colors.black,
            ),
            foregroundColor: WidgetStatePropertyAll(
              i == 0 ? AppTheme.colors.gray : secondButtonTextColor ?? Colors.white,
            ),
            overlayColor: WidgetStatePropertyAll(
              i == 0 ? AppTheme.colors.black.withOpacity(0.1) : AppTheme.colors.white.withOpacity(0.1),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: Text(buttonLabels[i]),
          onPressed: () => BaseNavigator.pop(i == 1),
        );
        buttons.add(
          Expanded(child: button),
        );
        if (i == 0) {
          buttons.add(const SizedBox(width: 8));
        }
      }
    }

    double bottomPadding = Get.mediaQuery.padding.bottom > 0 ? 20 : 0;

    return Get.bottomSheet(
      Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, bottomPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(builder: (ctx) {
                if (title == null) {
                  return const SizedBox(height: 34);
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      title,
                      style: AppTheme.textStyles.semibold18Black,
                    ),
                  );
                }
              }),
              Text(
                description,
                style: TextStyle(
                  color: title == null ? Colors.black : const Color(0xff8A8D8E),
                  fontWeight: AppTheme.fontWeights.regular,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: title == null ? 36 : 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
