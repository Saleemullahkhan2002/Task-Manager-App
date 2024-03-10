import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_management/data/database.dart';
import 'package:task_management/utils/dialog_box.dart';
import 'package:task_management/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// refrence hive
  final _myBox = Hive.box('MyBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  // List todoList = [
  //   ['Buy groceries', false],
  //   ['Take out the trash', false],
  // ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];

      // todoList[index][1] = value ?? false;
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: saveNewTask,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
elevation: 2,        
  title: Text('Task Manager'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {
            createNewTask();
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunctioin: (BuildContext) {
                deleteTask(index);
              },
            );
          },
        ));
  }
}
