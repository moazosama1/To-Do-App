import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/main.dart';
import 'package:todo/module/auth/page/create_account.dart';
import 'package:todo/module/auth/page/widgets/bg_header.dart';
import 'package:todo/module/auth/page/widgets/custom_textField_password.dart';
import 'package:todo/module/auth/page/widgets/custom_textfield.dart';

import '../../../provider/manager/provider_auth_account.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";
  LoginScreen({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => ProviderAuthAccount(),
      child: Consumer<ProviderAuthAccount>(
        builder: (context, provider, child) {
          return Form(
            key: provider.formKeyLogin,
            child: BgHeader(
                child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(
                    //   flex: 1,
                    // ),
                    SizedBox(
                      height:  mediaQueryHeight * 0.27,
                    ),
                    Text("login".tr(),
                        style: TextStyle(
                            color: theme.colorScheme.onInverseSurface,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: mediaQueryHeight * 0.03,
                    ),
                    CustomTextFromField(
                      validateMessage: "invalidEmail".tr(),
                      iconData: Icons.attach_email,
                      isEmail: true,
                      theme: theme,
                      hintText: "email".tr(),
                      controller: provider.controllerAccount,
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.03,
                    ),
                    CustomTextFromFieldPassword(
                      theme: theme,
                      hintText: "password".tr(),
                      controller: provider.controllerPassword,
                    ),
                    SizedBox(
                      height: mediaQueryHeight * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        provider.loginAccount(context);
                      },
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "login".tr(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.secondary),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.login_outlined,
                                color: theme.colorScheme.onSecondaryContainer,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CreateAccount.routeName);
                        },
                        child: Text(
                          "signUp".tr(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary),
                        )),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
