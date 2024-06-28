import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stack_overflow/module/todo/model/todos_model.dart';

const String TODO_COLLECTION_REF = "todos";

class DatabaseService {
  final fireStore = FirebaseFirestore.instance;
  late final CollectionReference todoRef;

  DatabaseService() {
    todoRef = fireStore.collection(TODO_COLLECTION_REF).withConverter<TodoDTO>(
          fromFirestore: (snapShot, _) => TodoDTO.fromJson(
            snapShot.data()!,
          ),
          toFirestore: (todo, _) => todo.toJson(),
        );
  }

  Stream<QuerySnapshot> getTodo() => todoRef.snapshots();
  void addToDo(TodoDTO todo) => todoRef.add(todo);

  void updateTodo(String todoId, TodoDTO todo) {
    todoRef.doc(todoId).update(todo.toJson());
  }

  void deleteTodo(String todoId) {
    todoRef.doc(todoId).delete();
  }
}
