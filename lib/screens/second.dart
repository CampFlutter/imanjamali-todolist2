import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListScreen(),
    );
  }
}

class Todo {
  String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _todos.add(Todo(
        title: _controller.text,
        isDone: false,
      ));
      _controller.clear();
    });
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/44.png'),
          fit: BoxFit.cover
          ),
          ),
          child: Container(
            child: SafeArea(child: 
             Column(
              children: [
                _buildInputSection(),
                Expanded(child: _buildTodoList()),
              ],
            ),
            ),
            
          ),
    ));
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter a new task',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.orange),
            onPressed: _addTodo,
          ),
        ],
      ),
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index) {
        final todo = _todos[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading: IconButton(
              icon: Icon(
                todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: todo.isDone ? Colors.green : Colors.grey,
              ),
              onPressed: () => _toggleTodoStatus(index),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _removeTodo(index),
            ),
          ),
        );
      },
    );
  }
}
