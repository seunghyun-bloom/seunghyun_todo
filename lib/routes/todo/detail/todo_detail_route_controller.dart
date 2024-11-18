import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';

class TodoDetailRouteController extends GetxController {
  // ! ---- core ----

  TodoDetailRouteController(this.task);

  initialize() {
    title = task.title;
    description = task.description ?? '';
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  // ! ---- 할일 ----

  late TaskModel task;

  // ! ---- 수정 모드 ----

  bool isEditMode = false;

  onTapEditButton() {
    isEditMode = !isEditMode;
    update();
  }

  // ! ---- 타이틀 ----

  String title = '';

  onTitleChanged(String value) {
    title = value;
    update();
  }

  // ! ---- 설명 ----

  String description = '';

  onDescriptionChanged(String value) {
    description = value;
    update();
  }
}
