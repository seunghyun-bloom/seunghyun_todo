enum TaskStatus { yet, now, done }

class TaskModel {
  final String id;
  final String title;
  final String? description;
  final TaskStatus status;
  final int createdAt;
  final int lastUpdatedAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    TaskStatus? status,
    int? createdAt,
    int? lastUpdatedAt,
  }) {
    return TaskModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}
