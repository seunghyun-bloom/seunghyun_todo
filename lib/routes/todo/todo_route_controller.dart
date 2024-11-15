import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';
import 'package:seunghyun_todo/routes/todo/todo_route_component.dart';

class TodoRouteController extends GetxController {
  // ! ---- core ----

  initialize() {}

  @override
  void onInit() {
    super.onInit();
  }

  // ! ---- 할일 목록 ----
  List<TaskModel> tasks = [];

  // ! ---- 할일 제어 ----
  onStatusChanged(TaskModel model, TaskStatus newStatus) {
    TaskModel updatedTaks = model.copyWith(
      status: newStatus,
      lastUpdatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    int index = tasks.indexOf(model);
    tasks.remove(model);
    tasks.insert(index, updatedTaks);
    update();
  }

  onDeleted(TaskModel model) {
    tasks.remove(model);
    update();
  }

  // ! ---- FAB ----
  onTapFAB() {
    return Get.dialog(TodoRouteComponent.createDialog()).then((result) {
      if (result is TaskModel) {
        tasks.add(result);
        update();
      }
    });
  }
}
