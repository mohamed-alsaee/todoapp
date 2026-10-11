import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/tasks_provider.dart';
import 'package:todoapp/widgets/cards/task_card.dart';
import 'package:todoapp/widgets/dialogs/add_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksConsumer, _) {
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
                        Tab(text: "Waiting"), // 0
                        Tab(text: "Completed"), // 1
                      ],

                      onTap: (i) {
                        if (kDebugMode) {
                          print("INDEX : $i");
                        }
                        setState(() {
                          tabIndex = i;
                        });
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tasksConsumer.tasks.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return tabIndex == 0 &&
                                  !tasksConsumer.tasks[index].isDone
                              ? TaskCard(
                                  taskModel: tasksConsumer.tasks[index],
                                  onSwitch: () {
                                    tasksConsumer.switchIsDone(
                                      tasksConsumer.tasks[index],
                                    );
                                  },
                                )
                              : tabIndex == 1 &&
                                    tasksConsumer.tasks[index].isDone
                              ? TaskCard(
                                  taskModel: tasksConsumer.tasks[index],
                                  onSwitch: () {
                                    tasksConsumer.switchIsDone(
                                      tasksConsumer.tasks[index],
                                    );
                                  },
                                )
                              : SizedBox();
                        },
                      ),
                      // TabBarView(
                      //   children: [
                      //     ListView.builder(
                      //       itemCount: tasksConsumer.tasks.length,
                      //       shrinkWrap: true,
                      //       itemBuilder: (context, index) {
                      //         return !tasksConsumer.tasks[index].isDone
                      //             ? TaskCard(
                      //                 taskModel: tasksConsumer.tasks[index],
                      //                 onSwitch: () {
                      //                   // setState(() {
                      //                   //   tasks[index].isDone =
                      //                   //       !tasks[index].isDone;
                      //                   // });
                      //                   tasksConsumer.switchIsDone(
                      //                     tasksConsumer.tasks[index],
                      //                   );
                      //                 },
                      //               )
                      //             : SizedBox();
                      //       },
                      //     ),
                      //     ListView.builder(
                      //       itemCount: tasksConsumer.tasks.length,
                      //       shrinkWrap: true,
                      //       itemBuilder: (context, index) {
                      //         return tasksConsumer.tasks[index].isDone
                      //             ? TaskCard(
                      //                 taskModel: tasksConsumer.tasks[index],
                      //                 onSwitch: () {
                      //                   // setState(() {
                      //                   //   tasks[index].isDone =
                      //                   //       !tasks[index].isDone;
                      //                   // });
                      //                   tasksConsumer.switchIsDone(
                      //                     tasksConsumer.tasks[index],
                      //                   );
                      //                 },
                      //               )
                      //             : SizedBox();
                      //       },
                      //     ),
                      //   ],
                      // ),
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
      },
    );
  }
}
