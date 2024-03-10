import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunctioin;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunctioin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunctioin,
              icon: Icons.delete,)
        ]),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                // chkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                // task
                Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
