import 'package:hive/hive.dart';

class ToDoDataBase {
  List todoList = [];
  final _myBox = Hive.box('MyBox');

  void createInitialData() {
    todoList = [
      ['do exercise', false]
    ];
  }

  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  void updateDataBase() {
    _myBox.put('TODOLIST', todoList);
  }
}
