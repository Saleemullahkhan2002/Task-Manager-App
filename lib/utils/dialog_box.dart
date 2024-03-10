import 'package:flutter/material.dart';
import 'package:task_management/utils/myButton.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        width: MediaQuery.of(context).size.width * .08,
        height: MediaQuery.of(context).size.height * 1 / 4,
        child: Container(
          height: MediaQuery.of(context).size.height * 2 / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'add new task '),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // save button
                  MyButton(text: 'Save', onPressed: onSave),
                  // cancel button
                  // SizedBox(width: 20),
                  MyButton(text: 'cancel', onPressed: onCancel)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
