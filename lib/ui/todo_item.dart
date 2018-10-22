import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({this.text, this.onPress, this.checked, this.index});
  final String text;
  final ValueChanged<int> onPress;
  final bool checked;
  final int index;

  void _handlePress() {
    onPress(index);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: _handlePress,
      leading: new Checkbox(
        value: this.checked,
        onChanged: null,
      ),
      title: new Text(
        text,
        textAlign: TextAlign.left,
        style: new TextStyle(
          fontSize: 16.0,
        )
      ),
      trailing: this.checked ? new Text(
        'Click again to delete.',
        textAlign: TextAlign.right,
      ) : null,
    );
  }
}