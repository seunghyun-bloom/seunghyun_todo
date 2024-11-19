import 'package:get_storage/get_storage.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';

class PropertyClient {
  static final PropertyClient instance = PropertyClient._internal();
  PropertyClient._internal();
  factory PropertyClient() {
    return instance;
  }

  GetStorage storage = GetStorage();

  // ! ---- Tasks ----

  List<TaskModel> getTasks() {
    List<dynamic> rawTasks = storage.read<List<dynamic>>("tasks") ?? [];
    return rawTasks.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future setTasks(List<TaskModel> value) {
    List<Map<String, dynamic>> decodedValue = value.map((e) => e.toMap()).toList();
    return storage.write('tasks', decodedValue);
  }
}
