import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';
import 'package:seunghyun_todo/infra/router/base_navigator.dart';
import 'package:seunghyun_todo/infra/tools/property_client.dart';
import 'package:seunghyun_todo/routes/todo/detail/todo_detail_route.dart';
import 'package:seunghyun_todo/routes/todo/todo_route_component.dart';

class TodoRouteController extends GetxController {
  // ! ---- core ----
  initilaize() {
    readStorage();
  }

  @override
  void onInit() {
    initilaize();
    super.onInit();
  }

  // ! ---- 할일 목록 ----

  List<TaskModel> tasks = [];

  // ! ---- 스토리지 ----

  readStorage() {
    tasks = PropertyClient.instance.getTasks();
    update();
  }

  Future updateStorage() {
    return PropertyClient.instance.setTasks(tasks);
  }

  // ! ---- 할일 리스트 아이템 ----

  onTapTask(TaskModel model) {
    BaseNavigator.bottomSheet(TodoDetailRoute(model: model)).then((value) {
      if (value is TaskModel) {
        int index = tasks.indexWhere((e) => e.id == value.id);
        if (index != -1) {
          tasks[index] = value;
          updateStorage();
          update();
        }
      }
    });
  }

  onStatusChanged(TaskModel model, TaskStatus newStatus) {
    TaskModel updatedTaks = model.copyWith(
      status: newStatus,
      lastUpdatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    int index = tasks.indexOf(model);
    tasks.remove(model);
    tasks.insert(index, updatedTaks);
    updateStorage();
    update();
  }

  onDeleted(TaskModel model) {
    tasks.remove(model);
    updateStorage();
    update();
  }

  // ! ---- FAB ----

  onTapFAB() {
    return Get.dialog(TodoRouteComponent.createDialog()).then((result) {
      if (result is TaskModel) {
        tasks.add(result);
        updateStorage();
        update();
      }
    });
  }
}
