import 'package:flutter/material.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';

class UtilClient {
  static Color statusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.yet:
        return Colors.amber.shade600;
      case TaskStatus.now:
        return Colors.indigo;
      case TaskStatus.done:
        return Colors.teal;
    }
  }
}
