import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/providers/tasks_provider.dart';

class AddTaskDialog extends StatefulWidget {
  const new({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksConsumer, _) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ADD NEW TASK", style: TextStyle(fontSize: 20)),
                SizedBox(height: 12),
                TextFormField(controller: titleController),
                SizedBox(height: 12),
                TextFormField(controller: subTitleController),
                SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          tasksConsumer.addTask(
                            TaskModel(
                              title: titleController.text,
                              subtitle: subTitleController.text.isEmpty
                                  ? null
                                  : subTitleController.text,

                              createdAt: DateTime.now(),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Text("ADD"),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
