import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/module/auth/page/create_account.dart';
import 'package:todo/module/auth/page/login.dart';
import 'package:todo/module/onboarding/widget/header_bg.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return HeaderBg(
        imagePath: "assets/images/onboarding/Shape 3.png",
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              Image(
                image: const AssetImage(
                    "assets/images/onboarding/image/login.png"),
                width: mediaQueryWidth * 0.7,
                height: mediaQueryHeight * 0.45,
              ),
              SizedBox(
                height: mediaQueryHeight * 0.02,
              ),
              Text(
                "signInAndAccess".tr(),
                style: TextStyle(
                    color: theme.colorScheme.inversePrimary,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: mediaQueryHeight * 0.02,
              ),
              Text(
                "Securely manage your tasks by creating an account or logging in."
                    .tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: theme.colorScheme.inversePrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          CreateAccount.routeName,
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Text(
                        "signUpNewAccount".tr(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )),
                  const SizedBox(width: 4,),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routeName,
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Text(
                        "login".tr(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )),
                ],
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}
