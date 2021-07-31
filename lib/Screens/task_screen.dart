import 'package:flutter/material.dart';
import 'package:todo/Widgets/tasks_list.dart';
import 'package:todo/Screens/add_task_screen.dart';
import 'package:todo/models/task_data.dart';
import 'package:provider/provider.dart';


class TasksScreen extends StatefulWidget {

//instead of using this widget we can do it shortly
// Widget buildButtonSheet(BuildContext context){
//   return Container();
//   }
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF9575CD),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  )
              )
          );
        },
        backgroundColor: Colors.white ,
        child: Icon(Icons.add,
            color: Color(0xFFB39DDB)
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 60.0,left: 30,bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //this is for the top icon
            CircleAvatar(
              child: Icon(
                          Icons.list,
                          size:30.0 ,
                          color: Color(0xFFB39DDB),
                         ),
              backgroundColor: Colors.white,
              radius: 30.0,
            ),

              SizedBox(height: 10.0),

              Text('Todo-to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),),

              Text(
                '${Provider.of<TaskData>(context).taskCount} Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
          //for the lower part of the screen
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFFCEC6E8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)
                ),
              ),
              child: TasksList(),
              ),
            ),
       ],
      ),
    );
  }
}




