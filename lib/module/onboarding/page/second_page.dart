import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/onboarding/Shape 2.png"),
              fit: BoxFit.fitWidth , alignment: Alignment.topCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4,),
            Image(
              image: const AssetImage(
                  "assets/images/onboarding/image/notes.png"),
              width: mediaQueryWidth * 0.7,
              height: mediaQueryHeight * 0.4,
            ),
            SizedBox(
              height: mediaQueryHeight * 0.02,
            ),
            Text(
              "editExisting".tr(),
              style: TextStyle(
                  color: theme.colorScheme.inversePrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.02,
            ),
            Text(
              "Update or modify your tasks at any time to reflect your progress or changes in your schedule.".tr(),
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
