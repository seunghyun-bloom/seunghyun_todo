import 'package:flutter/material.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';
import 'package:seunghyun_todo/infra/router/base_navigator.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';
import 'package:seunghyun_todo/infra/tools/format_client.dart';

class TodoRouteComponent {
  static Widget task(TaskModel model) {
    return ExpansionTile(
      title: Text(model.title),
      subtitle: Text(
        FormatClient.date(model.lastUpdatedAt),
      ),
      trailing: Text(
        FormatClient.taskStatus(model.status),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(model.description ?? ''),
        ),
      ],
    );
  }

  static Widget createDialog() {
    TextEditingController titleEC = TextEditingController();
    TextEditingController descriptionEC = TextEditingController();

    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '새 할일 만들기',
                style: AppTheme.textStyles.semibold16Black,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                label: Text('제목'),
                hintText: 'ex) 마트에서 장보기',
              ),
              controller: titleEC,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                label: Text('메모'),
                hintText: 'ex) 라면, 우유, 세제...',
              ),
              controller: descriptionEC,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  if (titleEC.text.isEmpty) {
                    return BaseNavigator.pop();
                  }
                  TaskModel task = TaskModel(
                    title: titleEC.text,
                    description: descriptionEC.text,
                    status: TaskStatus.yet,
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                    lastUpdatedAt: DateTime.now().millisecondsSinceEpoch,
                  );
                  BaseNavigator.pop(task);
                },
                child: const Text('추가하기'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
