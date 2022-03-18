import 'package:flutter/material.dart';

void showMessage(BuildContext context,String message,String actionName,VoidCallback actionCallBack){
  showDialog(
      context: context,
      builder: (buildContext){
        return AlertDialog(
          content:Text(message),
          actions: [
            TextButton(
            onPressed: actionCallBack,
           child: Text(actionName),),
          ],
        );
      });
}

void showLoading(BuildContext context,String message){
 showDialog(
     context: context,
     builder: (buildContext){
   return AlertDialog(
    content: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20,),
          Text(message),
        ],
      ),
    ),
   );
 });
}

void hideLoadingDialoge(BuildContext context){
  Navigator.pop(context);
}