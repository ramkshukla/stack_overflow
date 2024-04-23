import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDTO {
  final String task;
  final bool isDone;
  final Timestamp createdOn;
  final Timestamp updatedOn;

  TodoDTO({
    required this.task,
    required this.isDone,
    required this.createdOn,
    required this.updatedOn,
  });

  factory TodoDTO.fromJson(Map<String, dynamic> json) {
    return TodoDTO(
      task: json["task"] as String,
      isDone: json["isDone"] as bool,
      createdOn: json["createdOn"] as Timestamp,
      updatedOn: json["updatedOn"] as Timestamp,
    );
  }

  TodoDTO copyWith({
    String? task,
    bool? isDone,
    Timestamp? createdOn,
    Timestamp? updatedOn,
  }) {
    return TodoDTO(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "task": task,
      "isDone": isDone,
      "createdOn": createdOn,
      "updatedOn": updatedOn,
    };
  }
}
