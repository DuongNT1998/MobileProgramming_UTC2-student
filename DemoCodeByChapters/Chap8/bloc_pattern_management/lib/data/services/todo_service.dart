import '../models/todo_model.dart';

class TodoService {
  final List<Todo> _todos = [];

  List<Todo> getTodos() => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title));
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
  }
}
