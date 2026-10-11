import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/widgets/dialogs/remove_task_dialog.dart';

class TaskCard extends StatelessWidget {
  const new({super.key, required this.taskModel, required this.onSwitch});
  final TaskModel taskModel;
  final Function onSwitch;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => RemoveTaskDialog(taskModel: taskModel),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: taskModel.isDone ? 0.5 : 1),

            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        taskModel.title,
                        style: TextStyle(
                          fontSize: 22,
                          color: taskModel.isDone
                              ? Colors.white38
                              : Colors.white,
                        ),
                        maxLines: 2,
                      ),
                    ),

                    Checkbox(
                      value: taskModel.isDone,
                      onChanged: (value) {
                        onSwitch();
                      },
                    ),
                  ],
                ),

                Text(
                  taskModel.subtitle ?? "",
                  style: TextStyle(
                    color: taskModel.isDone ? Colors.white38 : Colors.white,
                    decoration: taskModel.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
