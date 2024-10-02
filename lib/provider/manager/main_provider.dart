import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/firebase/model/task_modle.dart';
import 'package:todo/core/firebase/model/user_model.dart';
import 'package:todo/core/firebase/serves/firebase_function.dart';
import 'package:todo/module/auth/page/login.dart';

import '../../module/layout/screen/settings_screen.dart';
import '../../module/layout/screen/task_screen.dart';

class MainProvider extends ChangeNotifier {
  int selectedIndex = 0;
  UserModel? userModel;
  DateTime pikerDate = DateTime.now();
  TimeOfDay pikerTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  GlobalKey<FormState> formKeyTitle = GlobalKey<FormState>();
  List<Widget> pages = [
    const TasksScreen(),
    SettingsScreen(),
  ];
  void changePage(int index) {
    selectedIndex = index;
    pages[selectedIndex];
    notifyListeners();
  }

  void setDate(DateTime time) {
    selectedDate = time;
    notifyListeners();
  }

  void setPikerDate(DateTime newDate) {
    pikerDate = newDate;
    notifyListeners();
  }

  void setPikerTime(TimeOfDay newTime) {
    pikerTime = newTime;
    notifyListeners();
  }

  addTask() async {
    TaskModel taskModel = TaskModel(
      time: "${pikerTime.hour} : ${pikerTime.minute}",
      date: DateUtils.dateOnly(pikerDate).millisecondsSinceEpoch,
      title: titleEditingController.text,
      isDone: false,
      desc: descEditingController.text,
    );
    await FirebaseFunction.addTask(taskModel);
    titleEditingController.clear();
    descEditingController.clear();
    notifyListeners();
  }

  Stream<QuerySnapshot<TaskModel?>> getTask() {
    return FirebaseFunction.getTask(
        DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
  }

  deleteTask(String id) async {
    FirebaseFunction.deleteTask(id);
    notifyListeners();
  }

  isDone(TaskModel task) async {
    FirebaseFunction.isDone(task);
    notifyListeners();
  }

  void logout(context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }

  void getUser() async {
    userModel = await FirebaseFunction.getUser();
    notifyListeners();
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return "titleInvalid".tr();
    }
    if (value.length > 15) {
      return "titleMustBeLess15Char".tr();
    }
    return null;
  }
}
