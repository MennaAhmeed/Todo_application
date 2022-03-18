import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task.dart';

CollectionReference<Task> getTasksCollection() {
  return FirebaseFirestore.instance
      .collection('tasks')
      .withConverter<Task>(fromFirestore: (docsnapshot, snapshotoptions) {
    return Task.fromJson(docsnapshot.data()!);
  }, toFirestore: (task, _) {
    return task.toJson();
  });
}

Future<void> addTaskToFireStore(Task task) {
  var collection = getTasksCollection();
  var newDoc=collection.doc();
  task.id=newDoc.id;
  return newDoc.set(task);
}
