import 'package:flutter/material.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';
import 'package:seunghyun_todo/infra/tools/format_client.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '제목',
            style: AppTheme.textStyles.semibold16,
          ),
          const SizedBox(height: 14),
          Builder(
            builder: (context) {
              if (isEditMode) {
                return TextFormField(
                  initialValue: title,
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    hintText: 'ex) 마트에서 장보기',
                  ),
                  maxLength: 16,
                );
              } else {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: AppTheme.textStyles.regular14,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  static Widget description({
    required String description,
    required bool isEditMode,
    required Function(String value) onChanged,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '메모',
            style: AppTheme.textStyles.semibold16,
          ),
          const SizedBox(height: 14),
          Builder(
            builder: (context) {
              if (isEditMode) {
                return TextFormField(
                  initialValue: description,
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    hintText: 'ex) 라면, 우유, 세제...',
                  ),
                  maxLines: 5,
                  minLines: 1,
                );
              } else {
                return Text(
                  description,
                  style: AppTheme.textStyles.regular14,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  static Widget date({
    required int date,
    required bool isEditMode,
  }) {
    if (isEditMode) {
      return const SizedBox();
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '최근 수정일',
            style: AppTheme.textStyles.semibold16,
          ),
          const SizedBox(height: 14),
          Text(
            FormatClient.dateTime(date),
            style: AppTheme.textStyles.regular14,
          ),
        ],
      ),
    );
  }
}
