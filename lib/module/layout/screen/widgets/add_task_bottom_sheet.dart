import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/layout/screen/widgets/textfield.dart';
import 'package:todo/provider/manager/main_provider.dart';

class AddNewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Consumer<MainProvider>(
      builder: (context, firstProvider, child) {
        return Form(
          key: firstProvider.formKeyTitle,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: mediaQueryHeight * 0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: mediaQueryWidth * 0.25,
                        height: mediaQueryHeight * 0.005,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Text(
                      "addNewTask".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    CustomTextField(
                        validatorText: firstProvider.validateTitle,
                        title: "title".tr(),
                        textEditingController:
                            firstProvider.titleEditingController),
                    SizedBox(
                      height: mediaQueryHeight * 0.015,
                    ),
                    CustomTextField(
                        validatorText: (p0) {},
                        title: "desc".tr(),
                        textEditingController: firstProvider.descEditingController),
                    SizedBox(
                      height: mediaQueryHeight * 0.015,
                    ),
                    InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: firstProvider.pikerDate,
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(const Duration(days: 365)))
                            .then((value) => firstProvider.setPikerDate(value!));
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "selectDate".tr(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.date_range_rounded,
                                size: 25,
                                color: Theme.of(context).colorScheme.inversePrimary,
                              )
                            ],
                          ),
                          Text(
                            firstProvider.pikerDate.toString().substring(0, 10),
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.inversePrimary),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: mediaQueryHeight * 0.015,),
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) => firstProvider.setPikerTime(value!));
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "selectTime".tr(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                CupertinoIcons.timer,
                                size: 25,
                                color: Theme.of(context).colorScheme.inversePrimary,
                              )
                            ],
                          ),
                          Text(
                            firstProvider.pikerTime.format(context),
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.inversePrimary),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          firstProvider.addTask();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Text(
                          "addNewTask".tr(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
