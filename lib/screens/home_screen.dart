import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/widgets/cards/task_card.dart';
import 'package:todoapp/widgets/dialogs/add_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [
    TaskModel(
      title: "Course Lec 1 Course Lec 1Course Lec 1Course Lec 1Course Lec 1",
      createdAt: DateTime.now(),
    ),
    TaskModel(
      title: "Course Lec 2",
      subtitle: "No no no No no no No no no No no no No no no No no no No no no No no no No no no No no no No no no No no no ",
      createdAt: DateTime.now(),
    ),
    TaskModel(title: "Course Lec 3", subtitle: "No", createdAt: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: "Completed"),
                    Tab(text: "Waiting"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: tasks.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return tasks[index].isDone
                              ? TaskCard(
                                  taskModel: tasks[index],
                                  onSwitch: () {
                                    setState(() {
                                      tasks[index].isDone =
                                          !tasks[index].isDone;
                                    });
                                  },
                                )
                              : SizedBox();
                        },
                      ),
                      ListView.builder(
                        itemCount: tasks.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return !tasks[index].isDone
                              ? TaskCard(
                                  taskModel: tasks[index],
                                  onSwitch: () {
                                    setState(() {
                                      tasks[index].isDone =
                                          !tasks[index].isDone;
                                    });
                                  },
                                )
                              : SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTaskDialog(),
          ).then((v) {
            if (v != null) {}
          });
        },
      ),
    );
  }
}
