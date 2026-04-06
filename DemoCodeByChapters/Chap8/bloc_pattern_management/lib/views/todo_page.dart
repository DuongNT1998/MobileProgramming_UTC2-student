import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/todo_bloc.dart';
import '../state/todo_event.dart';
import '../state/todo_state.dart';
import '../widgets/todo_item.dart';

class TodoPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();

    return Scaffold(
      appBar: AppBar(title: Text("BLoC Todo App")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Enter todo",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              bloc.add(AddTodo(controller.text));
              controller.clear();
            },
            child: Text("Add"),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (_, index) {
                    return TodoItem(
                      title: state.todos[index].title,
                      onDelete: () {
                        bloc.add(RemoveTodo(index));
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
