import 'package:flutter/material.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';

class UtilClient {
  static String uniqueId() {
    String date = DateTime.now().millisecondsSinceEpoch.toString();
    String uniqueKey = UniqueKey().toString();
    return '$uniqueKey-$date';
  }

  static Color statusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.yet:
        return Colors.orange;
      case TaskStatus.now:
        return Colors.indigo;
      case TaskStatus.done:
        return Colors.teal;
    }
  }
}
