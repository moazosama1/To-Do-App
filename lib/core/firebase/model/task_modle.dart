import 'dart:core';

class TaskModel {
  String id;
  String userId;
  String title;
  String desc;
  String time;
  int date;
  bool isDone;
  TaskModel(
      {this.id = '',
        this.userId = '',
      required this.time,
      required this.date,
      required this.title,
      required this.isDone,
      required this.desc});
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json["id"],
        userId: json["userId"],
        time: json["time"],
        date: json["date"],
        title: json["title"],
        isDone: json["isDone"],
        desc: json["desc"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "userId": userId,
      "desc": desc,
      "time": time,
      "date": date,
      "isDone": isDone
    };
  }
}
