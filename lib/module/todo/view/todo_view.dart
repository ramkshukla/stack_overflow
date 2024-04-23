import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/home/view/home_view.dart';
import 'package:stack_overflow/module/todo/model/todos_model.dart';
import 'package:stack_overflow/module/todo/repo/database_services.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late final DatabaseService databaseService;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    ">>>>>>Calling IninState".logIt;
    databaseService = DatabaseService();
    ">>>>>>DataServices: ${databaseService.getTodo()}".logIt;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ">>>>>>>DidChangeDependencies Method ".logIt;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ">>>>>Build Method ".logIt;
    return Scaffold(
      appBar: AppBar(title: Text("TODO")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: databaseService.getTodo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List todos = snapshot.data!.docs;
                  if (todos.isEmpty) {
                    return Center(child: Text("Add a Todo"));
                  }
                  "TODOS: $todos".logIt;
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      TodoDTO todo = todos[index].data();
                      String todoId = todos[index].id;
                      "Todo: $todo";
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          tileColor: Colors.blue.withOpacity(0.3),
                          title: Text(todo.task),
                          subtitle: Text(
                            DateFormat("dd-MM-yyyy h:mm a")
                                .format(todo.createdOn.toDate()),
                          ),
                          trailing: Checkbox(
                            tristate: true,
                            value: todo.isDone,
                            onChanged: (value) {
                              TodoDTO updatedTodoDTO = todo.copyWith(
                                isDone: !todo.isDone,
                                updatedOn: Timestamp.now(),
                              );
                              databaseService.updateTodo(
                                  todoId, updatedTodoDTO);
                            },
                          ),
                          onLongPress: () {
                            databaseService.deleteTodo(todoId);
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Text("");
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addTODO(context);
        },
      ),
    );
  }

  @override
  void didUpdateWidget(covariant Todo oldWidget) {
    ">>>>>>>DidUpdateWidget called".logIt;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    ">>>>>>Deactivate called".logIt;
    super.deactivate();
  }

  @override
  void dispose() {
    ">>>>>>Dispose Called".logIt;
    super.dispose();
  }

  Future<void> addTODO(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add a Todo..."),
            content: TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Todo..."),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Ok"),
                onPressed: () {
                  TodoDTO todoDTO = TodoDTO(
                    task: textEditingController.text,
                    isDone: false,
                    createdOn: Timestamp.now(),
                    updatedOn: Timestamp.now(),
                  );

                  databaseService.addToDo(todoDTO);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                  textEditingController.clear();
                },
              )
            ],
          );
        });
  }
}
