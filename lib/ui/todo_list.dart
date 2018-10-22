import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/todo.dart';
import 'package:flutter_todo_list/ui/todo_item.dart';

class TodoList extends StatelessWidget{
  const TodoList({this.items, this.onPress});

  final List<Todo> items;
  final ValueChanged<int> onPress;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: _buildTodoItem, itemCount: items.length,
    );
  }

  Widget _buildTodoItem(BuildContext context, int index) {
    Todo todo = items[index];
    return new TodoItem(text: todo.text, onPress: this.onPress, checked: todo.checked, index: index );
  }
}