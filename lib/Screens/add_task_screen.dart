import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle ='';
    return Container(
      color: Color(0xFF44355D),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xFFCEC6E8),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color:Colors.black
            )
            ),
            //textfield is used to take text inout from the user
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newTaskTitle=newText;
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Color(0xFF9575CD)
              ),
              onPressed:(){
                Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
              },

                child: Text('Add',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                ),
                ),
          ],
        ),
      ),

      );
  }
}
