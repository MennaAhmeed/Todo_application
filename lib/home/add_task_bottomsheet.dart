import 'package:flutter/material.dart';
import 'package:todo_app/date_utilities.dart';
import 'package:todo_app/my_theme.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}
class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Center(
              child: Text('Add New task',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 22,
              fontWeight: FontWeight.bold,),
              ),
          ),
          Form(
            child: Column(
            children: [
              TextFormField(
            decoration: InputDecoration(
              labelText: 'title',
            ),
            ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                minLines: 4,
                maxLines: 4,
              ),
             ],
          ),
          ),
        Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Text('Select Date',
             style:Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20,),),
             SizedBox(
               height: 15,
             ),
             InkWell(
                 onTap: (){
                   showTaskDatePicker();
                 },
                 child: Text(formatDate('dd/MM/yyyy', selectedDate),
                 style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15,),),
             ),
             SizedBox(
               height: 10,
             ),
             ElevatedButton(
               onPressed: (){
               },
               child: Text('Add',
                   style:Theme.of(context).textTheme.bodyText1?.copyWith(
                     fontSize: 20,
                     color:MyThemeData.colorWhite,)),
             ),
           ],
          ),
        ),
        ],
      ),
    );
  }

  void showTaskDatePicker()async{
    var date=await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365),),
    );
    if(date!=null){
      selectedDate=date;
      setState(() {
      });
    }
  }
}