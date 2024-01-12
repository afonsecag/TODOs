import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/task_view_model.dart';
import '../theme.dart'; 

class TaskListView extends ConsumerWidget {

    void showAddTaskDialog(BuildContext context, WidgetRef ref) {

    final TextEditingController _textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(controller: _textController),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                final String taskTitle = _textController.text;
                if (taskTitle.isNotEmpty) {
                  ref.read(taskListProvider.notifier).addTask(taskTitle);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Que hay, User!', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context, ref);
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
        body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card( 
            color: taskColor, 
            child: ListTile(
              title: Text(task.title, style: task.isCompleted ? taskTitleStyle.copyWith(decoration: TextDecoration.lineThrough) : taskTitleStyle),
              leading: Checkbox(
                value: task.isCompleted,
                onChanged: (_) => ref.read(taskListProvider.notifier).finishTask(task.id),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => ref.read(taskListProvider.notifier).deleteTask(task.id),
              ),
            ),
          );
        },
      ),
    );
  }
}

