import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/firebase/model/task_modle.dart';
import 'package:todo/provider/manager/provider_edite_task.dart';
import 'package:todo/module/layout/screen/widgets/textfield.dart';

class EditTask extends StatelessWidget {
  static const String routeName = "EditTask";

  EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    EditeTaskProvider provider = EditeTaskProvider();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    if (provider.task == null) {
      var task = ModalRoute.of(context)?.settings.arguments as TaskModel;
      provider.initTask(task);
    }
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: Consumer<EditeTaskProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: provider.formKey,
              child: Stack(
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.primary,
                    width: double.infinity,
                    height: mediaQueryHeight * 0.23,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  color: theme.colorScheme.secondary,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("edite".tr(),
                                  style: theme.textTheme.titleMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: mediaQueryWidth * 0.8,
                      height: mediaQueryHeight * 0.7,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Text(
                              "editTask".tr(),
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: theme.colorScheme.inversePrimary),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                                validatorText: (p0) {
                                  return provider.validateText(p0 ?? "");
                                },
                                title: "title".tr(),
                                textEditingController:
                                    provider.controllerTitle),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                                validatorText: (p0) {
                                  return provider.validateText(p0 ?? "");
                                },
                                title: "desc".tr(),
                                textEditingController: provider.controllerDesc),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  provider.showDatePickerOnScreen(context);
                                },
                                child: Text(
                                  "selectDate".tr(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: theme.colorScheme.inversePrimary),
                                )),
                            Text(DateFormat.yMMMd()
                                .format(provider.selectedDate),style: TextStyle(
                                color: theme.colorScheme.inversePrimary)),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                provider.showTimePickerInScreen(context);
                              },
                              child: Text("selectTime".tr(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: theme.colorScheme.inversePrimary)),
                            ),
                            Text(provider.selectedTime.format(context), style: TextStyle(
                                color: theme.colorScheme.inversePrimary)),
                            const Spacer(
                              flex: 4,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  provider.updateTask(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                child: !provider.isUpdate
                                    ? Text(
                                        "saveChanges".tr(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    : const CircularProgressIndicator(
                                        color: Colors.white,
                                      )),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
