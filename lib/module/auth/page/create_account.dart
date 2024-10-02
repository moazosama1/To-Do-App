import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/auth/page/widgets/bg_header.dart';
import 'package:todo/module/auth/page/widgets/custom_textField_password.dart';
import 'package:todo/module/auth/page/widgets/custom_textField_phone.dart';
import 'package:todo/module/auth/page/widgets/custom_textfield.dart';
import 'package:todo/provider/manager/provider_auth_account.dart';

class CreateAccount extends StatelessWidget {
  static const String routeName = "create";
  CreateAccount({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => ProviderAuthAccount(),
      builder: (context, child) {
        return Consumer<ProviderAuthAccount>(
          builder: (context, provider, child) {
            return Form(
              key: provider.formKeyCreate,
              child: BgHeader(
                  child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 6,
                      ),
                      Text("create".tr(),
                          style: TextStyle(
                              color:theme.colorScheme.onInverseSurface,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: mediaQueryHeight * 0.02,
                      ),
                      CustomTextFromField(
                        validateMessage: "invalidName".tr(),
                        iconData: CupertinoIcons.person,
                        isEmail: false,
                        theme: theme,
                        hintText: "name",
                        controller: provider.controllerName,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.02,
                      ),
                      CustomTextFromFieldPhone(
                        validateMessage: "invalidPhone".tr(),
                        theme: theme,
                        hintText: "phone",
                        controller: provider.controllerPhone,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.02,
                      ),
                      CustomTextFromField(
                        validateMessage: "invalidEmail".tr(),
                        iconData: Icons.attach_email,
                        isEmail: true,
                        theme: theme,
                        hintText: "email",
                        controller: provider.controllerAccount,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.02,
                      ),
                      CustomTextFromFieldPassword(
                        theme: theme,
                        hintText: "password",
                        controller: provider.controllerPassword,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          if (provider.formKeyCreate.currentState!.validate()) {
                            provider.createAccount(context);
                          }
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
                                  "create".tr(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.secondary),
                                ),
                                const Spacer(),
                                ImageIcon(
                                  const AssetImage(
                                      "assets/images/icons/add-user.png"),
                                  size: 30,
                                  color: theme.colorScheme.onSecondaryContainer,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "signIn".tr(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.primary),
                          )),
                    ],
                  ),
                ),
              )),
            );
          },
        );
      },
    );
  }
}
