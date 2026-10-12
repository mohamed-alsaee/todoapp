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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksConsumer, _) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              // autovalidateMode: AutovalidateMode.always,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ADD NEW TASK", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 12),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: titleController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Title is Required";
                      }

                      if (v.length <= 2) {
                        return "Title must be more than 2 chars";
                      }
                      return null;
                    },

                    inputFormatters: [],
                  ),
                  SizedBox(height: 12),
                  TextFormField(controller: subTitleController),
                  SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              tasksConsumer.addTask(
                                TaskModel(
                                  title: titleController.text,
                                  subtitle: subTitleController.text.isEmpty
                                      ? null
                                      : subTitleController.text,

                                  createdAt: DateTime.now().toIso8601String(),
                                ),
                              );
                              Navigator.pop(context);
                            }
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
          ),
        );
      },
    );
  }
}
