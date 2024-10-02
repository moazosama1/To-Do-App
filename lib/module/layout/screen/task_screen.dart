import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/firebase/model/task_modle.dart';
import 'package:todo/module/layout/screen/widgets/custom_task.dart';
import 'package:todo/module/layout/screen/widgets/header.dart';
import 'package:todo/provider/manager/main_provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQuerySize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => MainProvider()..getUser(),
      builder: (context, child) {
        return Consumer<MainProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Stack(
                  alignment: const Alignment(0, 1.99),
                  children: [
                    Header(
                        title: "hi".tr() +
                            " , " +
                            "${provider.userModel?.name.toUpperCase() ?? ""}"),
                    EasyInfiniteDateTimeLine(
                      firstDate: FirebaseAuth
                          .instance.currentUser!.metadata.creationTime!,
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      focusDate: provider.selectedDate,
                      showTimelineHeader: false,
                      onDateChange: provider.setDate,
                      activeColor: Colors.white,
                      dayProps: EasyDayProps(
                          todayHighlightStyle:
                              TodayHighlightStyle.withBackground,
                          todayHighlightColor: const Color(0xc069c9d7),
                          inactiveDayStyle: DayStyle(
                              dayStrStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 15),
                              monthStrStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 13),
                              dayNumStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 20),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10),
                              )),
                          activeDayStyle: DayStyle(
                              decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ))),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight * 0.1,
                ),
                StreamBuilder(
                  stream: provider.getTask(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("error".tr(),
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      );
                    } else {
                      List<TaskModel?> task =
                          snapshot.data!.docs.map((e) => e.data()).toList();
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CustomTaskCard(
                              taskModel: task[index]!,
                            );
                          },
                          itemCount: task.length,
                        ),
                      );
                    }
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
