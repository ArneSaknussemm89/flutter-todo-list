import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/todo.dart';
import 'package:flutter_todo_list/ui/todo_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(title: 'Flutter Todo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todos = [
    new Todo("Test item 1"),
    new Todo("Test item 2"),
    new Todo("Test item 3")
  ];

  final TextEditingController _textEditController = new TextEditingController();
  final FocusNode _focus = new FocusNode();

  void _checkTodoItem(int index) {
    setState(() {
      Todo todo = _todos[index];
      if (todo.checked) {
        _todos.removeAt(index);
      } else {
        todo.checked = true;
        _todos.replaceRange(index, index + 1, [todo]);
      }
    });
  }

  void _addTodoItem(String text) {
    setState(() {
      if (text.isNotEmpty) {
        Todo newTodo = new Todo(text);
        _todos.add(newTodo);
        _textEditController.clear();

        if (!_focus.hasFocus) {
          FocusScope.of(context).requestFocus(_focus);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: new TodoList(items: this._todos, onPress: this._checkTodoItem),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new TextField(
              controller: _textEditController,
              focusNode: _focus,
              autocorrect: true,
              maxLength: 255,
              onSubmitted: _addTodoItem,
              decoration: new InputDecoration(
                hintText: "Pick up milk..."
              )
            )
          )
        ],
      )
    );
  }
}
