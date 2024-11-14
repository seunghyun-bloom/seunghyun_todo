import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/models/task_model.dart';
import 'package:seunghyun_todo/routes/todo/todo_route_component.dart';
import 'package:seunghyun_todo/routes/todo/todo_route_controller.dart';

class TodoRoute extends StatelessWidget {
  const TodoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: TodoRouteController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              TaskModel model = controller.tasks[index];
              return TodoRouteComponent.task(model);
            },
          );
        },
      ),
      floatingActionButton: GetBuilder(
        init: TodoRouteController(),
        builder: (controller) {
          return FloatingActionButton(
            onPressed: controller.onTapFAB,
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
