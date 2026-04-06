import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../data/services/todo_service.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _service = TodoService();

  TodoBloc() : super(TodoState([])) {
    on<AddTodo>((event, emit) {
      _service.addTodo(event.title);
      emit(TodoState(List.from(_service.getTodos())));
    });

    on<RemoveTodo>((event, emit) {
      _service.removeTodo(event.index);
      emit(TodoState(List.from(_service.getTodos())));
    });
  }
}
