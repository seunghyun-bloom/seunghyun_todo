import 'package:seunghyun_todo/infra/models/task_model.dart';

class FormatClient {
  static String date(int millis) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millis);
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();

    if (date.month < 10) {
      month = '0${date.month}';
    }

    if (date.day < 10) {
      day = '0${date.day}';
    }

    return '$year-$month-$day';
  }

  static String dateTime(int millis) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millis);
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    String hour = date.hour.toString();
    String minute = date.minute.toString();

    if (date.month < 10) {
      month = '0${date.month}';
    }

    if (date.day < 10) {
      day = '0${date.day}';
    }

    if (date.hour < 10) {
      hour = '0${date.hour}';
    }

    if (date.minute < 10) {
      minute = '0${date.minute}';
    }

    return '$year-$month-$day $hour:$minute';
  }

  static String taskStatus(TaskStatus status) {
    switch (status) {
      case TaskStatus.yet:
        return '미완료';
      case TaskStatus.now:
        return '진행중';
      case TaskStatus.done:
        return '완료됨';
    }
  }
}
