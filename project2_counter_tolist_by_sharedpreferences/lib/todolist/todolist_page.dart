import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() {
    // TODO: implement createState
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  List<String> _todolist = [];

  var _taskController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _LoadList();
  }

  Future<void> _SaveList() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList("listdata", _todolist);
  }

  Future<void> _LoadList() async {
    final prefernces = await SharedPreferences.getInstance();
    setState(() {
      _todolist = prefernces.getStringList("listdata") ?? [];
    });
  }

  void _AddTask() {
    if (_taskController.text.isEmpty) {
      return;
    } else {
      setState(() {
        _todolist.add(_taskController.text);
      });
      _SaveList();
      _taskController.clear();
    }
  }

  void _DeleteTask(int index) {
    setState(() {
      _todolist.removeAt(index);
    });
    _SaveList();
  }

  void _EditTask(int index) async {
    var _EditTaskController = TextEditingController();
    _EditTaskController.text = _todolist[index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Your Task"),
          content: TextField(
            controller: _EditTaskController,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Edit Task",
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel Edit"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (_EditTaskController.text.isEmpty) {
                  return;
                } else {
                  setState(() {
                    _todolist[index] = _EditTaskController.text;
                  });
                  _SaveList();
                  Navigator.pop(context);
                }
              },
              child: Text("Save Edit"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List  "),
        centerTitle: true,
        backgroundColor: Colors.black45,
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: "Hello I'm Hasnat",
                      labelText: "Task Name",
                      prefixIcon: Icon(Icons.task_alt_rounded),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 6,),
                ElevatedButton(
                  onPressed: () {
                    _AddTask();
                  },
                  child: Text("Add Task"),
                ),
              ],
            ),
          ),

          // Now I display List of Tasks through ListView.builder as it is dynamic::
          Expanded(
            child: _todolist.isEmpty
                ? Center(child: Text("No Task Added Yet"))
                : ListView.builder(
                    itemCount: _todolist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(_todolist[index]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _EditTask(index);
                                },
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _DeleteTask(index);
                                },
                                icon: Icon(
                                  Icons.delete_forever_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
