import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';
import 'package:seunghyun_todo/infra/tools/format_client.dart';
import 'package:seunghyun_todo/infra/tools/util_client.dart';
import 'package:seunghyun_todo/routes/todo/detail/todo_detail_route_components.dart';
import 'package:seunghyun_todo/routes/todo/detail/todo_detail_route_controller.dart';

class TodoDetailRoute extends StatelessWidget {
  final TaskModel model;
  const TodoDetailRoute({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close),
          ),
          title: Text(
            FormatClient.taskStatus(model.status),
            style: TextStyle(
              color: UtilClient.statusColor(model.status),
            ),
          ),
          centerTitle: true,
          actions: [
            GetBuilder(
              init: TodoDetailRouteController(model),
              tag: model.id,
              builder: (controller) {
                return TodoDetailRouteComponents.editButton(
                  isEditMode: controller.isEditMode,
                  onTap: controller.onTapEditButton,
                );
              },
            )
          ],
        ),
        body: GetBuilder(
          init: TodoDetailRouteController(model),
          tag: model.id,
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    TodoDetailRouteComponents.title(
                      title: controller.title,
                      isEditMode: controller.isEditMode,
                      onChanged: controller.onTitleChanged,
                    ),
                    const SizedBox(height: 34),
                    TodoDetailRouteComponents.description(
                      description: controller.description,
                      isEditMode: controller.isEditMode,
                      onChanged: controller.onDescriptionChanged,
                    ),
                    const SizedBox(height: 34),
                    TodoDetailRouteComponents.date(
                      date: model.lastUpdatedAt,
                      isEditMode: controller.isEditMode,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
