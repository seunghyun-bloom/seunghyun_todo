import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';
import 'package:seunghyun_todo/infra/router/base_navigator.dart';
import 'package:seunghyun_todo/infra/settings/app_theme.dart';
import 'package:seunghyun_todo/infra/tools/format_client.dart';
import 'package:seunghyun_todo/infra/tools/util_client.dart';

class TodoRouteComponent {
  static Widget task({
    required TaskModel model,
    required Function(TaskModel model, TaskStatus newStatus) onStatusChanged,
    required Function(TaskModel model) onDeleted,
    required Function(TaskModel model) onTap,
  }) {
    return Slidable(
      key: Key(model.id),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onStatusChanged(model, TaskStatus.yet),
            backgroundColor: UtilClient.statusColor(TaskStatus.yet),
            foregroundColor: Colors.white,
            icon: Icons.close,
          ),
          SlidableAction(
            onPressed: (_) => onStatusChanged(model, TaskStatus.now),
            backgroundColor: UtilClient.statusColor(TaskStatus.now),
            foregroundColor: Colors.white,
            icon: Icons.play_arrow,
          ),
          SlidableAction(
            onPressed: (_) => onStatusChanged(model, TaskStatus.done),
            backgroundColor: UtilClient.statusColor(TaskStatus.done),
            foregroundColor: Colors.white,
            icon: Icons.check,
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onDeleted(model),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '삭제',
          )
        ],
      ),
      child: ListTile(
        tileColor: Colors.grey.withOpacity(0.1),
        title: Text(model.title),
        subtitle: Text(
          FormatClient.dateTime(model.lastUpdatedAt),
        ),
        trailing: Text(
          FormatClient.taskStatus(model.status),
          style: TextStyle(
            color: UtilClient.statusColor(model.status),
          ),
        ),
        onTap: () => onTap(model),
      ),
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
              maxLength: 16,
              controller: titleEC,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                label: Text('메모'),
                hintText: 'ex) 라면, 우유, 세제...',
              ),
              maxLines: 5,
              minLines: 1,
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
                    id: UtilClient.uniqueId(),
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
