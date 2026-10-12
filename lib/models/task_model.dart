// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  final String title;
  final String? subtitle;
  bool isDone;
  final String createdAt;

  TaskModel({
    required this.title,
    this.subtitle,
    this.isDone = false,
    required this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json["title"],
    subtitle: json["subtitle"],
    isDone: json["is_done"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "is_done": isDone,
    "created_at": createdAt,
  };
}
