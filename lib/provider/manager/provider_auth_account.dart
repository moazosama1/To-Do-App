import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/firebase/serves/firebase_function.dart';
import 'package:todo/module/layout/layout_screen.dart';

class ProviderAuthAccount extends ChangeNotifier {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerAccount = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  GlobalKey<FormState> formKeyCreate = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  bool secure = true;
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "passwordIsRequired".tr();
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long".tr();
    }
    return null;
  }

  String? validate(String? value, bool isEmail, String text) {
    if (value == null || value.trim().isEmpty) {
      return text;
    }
    if (isEmail) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return "checkYourEmail".tr();
      }
    }
    return null;
  }

  void createAccount(context) async {
    UserCredential credential = await FirebaseFunction.createAccount(
        controllerAccount.text,
        controllerPassword.text,
        controllerName.text,
        controllerPhone.text);
    if (credential.user != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LayoutScreen.routeName,
        (route) => false,
      );
      AnimatedSnackBar(
        builder: (context) {
          return  MaterialAnimatedSnackBar(
            titleText: 'success'.tr(),
            messageText: 'Welcome'.tr(),
            type: AnimatedSnackBarType.info,
            foregroundColor: Colors.white,
            titleTextStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.green,
          );
        },
      ).show(context);
    }
  }

  void loginAccount(context) async {
    try {
      UserCredential credential = await FirebaseFunction.loginAccount(
          controllerAccount.text, controllerPassword.text);
      if (credential.user != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LayoutScreen.routeName,
          (route) => false,
        );
        AnimatedSnackBar(
          builder: (context) {
            return MaterialAnimatedSnackBar(
              titleText: 'success'.tr(),
              messageText: 'welcome'.tr(),
              type: AnimatedSnackBarType.info,
              foregroundColor: Colors.white,
              titleTextStyle: const TextStyle(color: Colors.white),
              backgroundColor: Colors.green,
            );
          },
        ).show(context);
      }
    } catch (e) {
      AnimatedSnackBar(
        builder: ((context) {
          return MaterialAnimatedSnackBar(
            titleText: 'invalid'.tr(),
            messageText: 'emailOrPasswordInvalid'.tr(),
            type: AnimatedSnackBarType.info,
            foregroundColor: Colors.white,
            titleTextStyle:const TextStyle(
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
          );
        }),
      ).show(context);
    }
  }

  obSecure() {
    secure = !secure;
    notifyListeners();
  }
}
