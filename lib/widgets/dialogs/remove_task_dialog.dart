import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/providers/tasks_provider.dart';

class RemoveTaskDialog extends StatefulWidget {
  const new({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<RemoveTaskDialog> createState() => _RemoveTaskDialogState();
}

class _RemoveTaskDialogState extends State<RemoveTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksConsumer, _) {
        return AlertDialog(
          title: Text("Remove Task"),
          content: Text(
            "Are you sure you want to delete the ${widget.taskModel.title} task?",
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                tasksConsumer.removeTask(widget.taskModel);
                Navigator.pop(context);
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }
}
