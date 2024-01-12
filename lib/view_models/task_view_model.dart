import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

final taskListProvider = StateNotifierProvider<TaskListViewModel, List<Task>>((ref) {
  return TaskListViewModel();
});

class TaskListViewModel extends StateNotifier<List<Task>> {
  TaskListViewModel() : super([]);


  void addTask(String title) {
    state = [...state, Task(id: DateTime.now().toString(), title: title)];
  }

  void finishTask(String id) {
    state = state.map((task) {
      if (task.id == id) return Task(id: task.id, title: task.title, isCompleted: !task.isCompleted);
      return task;
    }).toList();
  }

  void deleteTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }


}