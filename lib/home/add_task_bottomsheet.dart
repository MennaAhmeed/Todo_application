import 'package:flutter/material.dart';
import 'package:todo_app/database/firebase_utils.dart';
import 'package:todo_app/date_utilities.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/utils.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}
class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate=DateTime.now();
  var formController=GlobalKey<FormState>();
  String title='';
  String description='';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              key: formController,
              child: Column(
              children: [
                TextFormField(
                  onChanged: (text){
                    this.title=text;
                  },
                  validator: (text){
                    if(text==null || text.isEmpty==true){
                      return 'please enter title ';
                    }
                    return null;
                  },
              decoration: InputDecoration(
                labelText: 'title',
              ),
              ),
                TextFormField(
                  onChanged: (text){
                    this.description=text;
                  },
                  validator: (text){
                    if(text==null || text.isEmpty==true){
                      return 'please enter description ';
                    }
                    return null;
                  },
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
                  addTask();
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
      ),
    );
  }


  void addTask()async{
    showLoading(context, 'Loading...');
    if(formController.currentState?.validate()==true){
      Task task=Task(title: title, description: description, dateTime: selectedDate.microsecondsSinceEpoch);
       addTaskToFireStore(task)
          .then((value){
            hideLoadingDialoge(context);
         showMessage(context, 'Task Added Successfully',
             'Ok', (){
           Navigator.pop(context);
      });
      }).catchError((error){
         hideLoadingDialoge(context);
         showMessage(context, "Error:cannot add task please try again", 'Ok', (){Navigator.pop(context);
         });
      });
    }
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