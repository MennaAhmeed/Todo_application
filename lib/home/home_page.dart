import 'package:flutter/material.dart';
import 'package:todo_app/home/add_task_bottomsheet.dart';
import 'package:todo_app/home/tabs/list_tab/task_list.dart';
import 'package:todo_app/home/tabs/settings_tab/settings.dart';
import 'package:todo_app/my_theme.dart';
class HomePage extends StatefulWidget {
static const String routeName='homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: MyThemeData.colorWhite,
            width: 4,
          ),
        ),
        elevation: 1.5,
        child: Icon(Icons.add,),
        onPressed: (){
          showAddTaskBottomSheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: MyThemeData.colorBlue,
        toolbarHeight: 120,
        title: Text('To Do List',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: MyThemeData.colorWhite,
        ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index){
            currentIndex=index;
            setState(() {
            });
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.list_outlined),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

   void showAddTaskBottomSheet(){
    showModalBottomSheet(
        context: context,
        builder: (buildContext){
          return AddTaskBottomSheet();
        }
        );
  }
   List<Widget>tabs=[
     TaskList(),
     SettingsTab(),
    ];
}
