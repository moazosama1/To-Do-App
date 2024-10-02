import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/exception/firebase_data_exception.dart';
import 'package:todo/core/exception/timeout_firebase_exception.dart';
import 'package:todo/core/firebase/model/task_modle.dart';
import 'package:todo/core/firebase/serves/firebase_function.dart';

class EditeTaskProvider extends ChangeNotifier {
  TaskModel? task;
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isUpdate = false;
  void initTask(TaskModel task) {
    this.task = task;
    controllerTitle.text = task.title;
    controllerDesc.text = task.desc;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(task.date);
    selectedTime = TimeOfDay(
        hour: int.parse(task.time.split(":")[0]),
        minute: int.parse(task.time.split(":")[1]));
  }

  void showDatePickerOnScreen(context) async {
    var date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        initialDate: selectedDate);
    selectedDate = date!;
    notifyListeners();
  }

  void showTimePickerInScreen(context) async {
    var data =
        await showTimePicker(context: context, initialTime: selectedTime);
    selectedTime = data!;
    notifyListeners();
  }

  updateTask(context) async {
    if (!isUpdate) {
      if (formKey.currentState!.validate()) {
        isUpdate = true;
        notifyListeners();
        task!.date = selectedDate.millisecondsSinceEpoch;
        task!.time = "${selectedTime.hour} : ${selectedTime.minute}";
        task!.title = controllerTitle.text;
        task!.desc = controllerDesc.text;
        try {
          await FirebaseFunction.updateTask(task!);
        } catch (e) {
          if (e is FirebaseDataException) {
            print("FirebaseDataException: ${e.errorMessage}");
            print(task?.id);
          } else if (e is TimeoutFirebaseException) {
            print("TimeoutFirebaseException: ${e.errorMessage}");
          } else {
            print("Unknown Exception: $e");
          }
        }finally{
          isUpdate = false ;
          notifyListeners();
          AnimatedSnackBar(
            builder: (context) {
              return MaterialAnimatedSnackBar(
                titleText: 'success'.tr(),
                messageText: 'modified'.tr(),
                type: AnimatedSnackBarType.info,
                foregroundColor: Colors.white,
                titleTextStyle: const TextStyle(color: Colors.white),
                backgroundColor: Colors.green,
              );
            },
          ).show(context);
        }
      }
    }
  }

  String? validateText(String input) {
    if (input.isEmpty) {
      return "invalidField".tr();
    }
    return null;
  }
}
