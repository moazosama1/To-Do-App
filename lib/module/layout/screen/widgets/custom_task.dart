import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/firebase/model/task_modle.dart';
import 'package:todo/module/layout/screen/edit_task_screen.dart';
import 'package:todo/provider/manager/main_provider.dart';

import '../../../../provider/manager/provider_theme.dart';

class CustomTaskCard extends StatelessWidget {
  final TaskModel taskModel;

  CustomTaskCard({required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    var mainProvider = Provider.of<MainProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                mainProvider.deleteTask(taskModel.id);
              },
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              icon: CupertinoIcons.delete,
              borderRadius: themeProvider.initialLanguage == "ar"
                  ? const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20))
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)),
              label: "delete".tr(),
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, EditTask.routeName,
                    arguments: taskModel);
              },
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: "edite".tr(),
              borderRadius: themeProvider.initialLanguage == "ar"
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))
                  : const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          height: mediaQueryHeight * 0.15,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              SizedBox(
                width: mediaQueryWidth * 0.05,
              ),
              Container(
                width: mediaQueryWidth * 0.013,
                height: mediaQueryHeight * 0.10,
                decoration: BoxDecoration(
                    color: taskModel.isDone == false
                        ? Theme.of(context).colorScheme.primary
                        : const Color(0xff61E757),
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(
                width: mediaQueryWidth * 0.08,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w800,
                        color: taskModel.isDone == false
                            ? Theme.of(context).colorScheme.primary
                            : const Color(0xff61E757)),
                  ),
                  SizedBox(height: mediaQueryHeight * 0.004),
                  Row(
                    children: [
                      SizedBox(
                        height: mediaQueryHeight * 0.03,
                        width: mediaQueryWidth * 0.5,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Text(
                              taskModel.desc ?? "",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQueryHeight * 0.004),
                  Row(
                    children: [
                      Icon(Icons.timer_sharp,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        TimeOfDay(
                                hour: int.parse(taskModel.time.split(":")[0]),
                                minute: int.parse(taskModel.time.split(":")[1]))
                            .format(context),
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.date_range,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        mainProvider.selectedDate.toString().substring(0, 10),
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    mainProvider.isDone(taskModel);
                  },
                  child: taskModel.isDone == false
                      ? Container(
                          width: mediaQueryWidth * 0.16,
                          height: mediaQueryWidth * 0.09,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      : Text(
                          "done".tr(),
                          style: TextStyle(
                              color: const Color(0xff61E757),
                              fontSize: 20,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w700),
                        )),
              SizedBox(
                width: mediaQueryWidth * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
