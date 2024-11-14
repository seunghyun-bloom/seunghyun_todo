enum TaskStatus { yet, now, done }

class TaskModel {
  final String title;
  final String? description;
  final TaskStatus status;
  final int createdAt;
  final int lastUpdatedAt;

  TaskModel({
    required this.title,
    this.description,
    required this.status,
    required this.createdAt,
    required this.lastUpdatedAt,
  });
}
