import 'package:flutter/material.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';

class TodoDetailRouteComponents {
  static Widget editButton({
    required bool isEditMode,
    required Function() onTap,
  }) {
    if (isEditMode) {
      return IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.check),
      );
    } else {
      return IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.edit),
      );
    }
  }

  static Widget title({
    required String title,
    required bool isEditMode,
    required Function(String value) onChanged,
  }) {
    if (isEditMode) {
      TextEditingController titleEC = TextEditingController(text: title);
      return TextField(
        controller: titleEC,
        onChanged: onChanged,
        decoration: const InputDecoration(
          label: Text('제목'),
          hintText: 'ex) 마트에서 장보기',
        ),
        maxLength: 16,
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: AppTheme.textStyles.semibold16Black,
        ),
      );
    }
  }

  static Widget description({
    required String description,
    required bool isEditMode,
    required Function(String value) onChanged,
  }) {
    if (isEditMode) {
      TextEditingController descriptionEC = TextEditingController(text: description);
      return TextField(
        controller: descriptionEC,
        onChanged: onChanged,
        decoration: const InputDecoration(
          label: Text('메모'),
          hintText: 'ex) 라면, 우유, 세제...',
        ),
        maxLines: 5,
        minLines: 1,
      );
    } else {
      return Text(
        description,
        style: AppTheme.textStyles.regular14Gray,
      );
    }
  }
}
