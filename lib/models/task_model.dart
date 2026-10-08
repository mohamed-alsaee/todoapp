class TaskModel {
  final String title;
  final String? subtitle;
  bool isDone;
  final DateTime createdAt;

  new({
    required this.title,
    this.subtitle,
    this.isDone = false,
    required this.createdAt,
  });
}
