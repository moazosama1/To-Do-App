
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/module/onboarding/widget/header_bg.dart';
import 'package:todo/provider/manager/provider_onboarding.dart';

class FirstPage extends StatelessWidget {
   FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var provider = OnboardingProvider();
    return HeaderBg(
      imagePath: "assets/images/onboarding/Group 1.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4,),
            Image(
              image: const AssetImage(
                  "assets/images/onboarding/image/task-list.png"),
              width: mediaQueryWidth * 0.8,
              height: mediaQueryHeight * 0.4,
            ),
            SizedBox(
              height: mediaQueryHeight * 0.02,
            ),
            Text(
              "welcome".tr(),
              style: TextStyle(
                  color: theme.colorScheme.inversePrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.02,
            ),
            Text(
              "To-Do List App is a user-friendly task management tool designed to help you stay organized and productive. With this app, you can effortlessly".tr(),
              style: TextStyle(
                  color: theme.colorScheme.inversePrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
