import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:todo/module/layout/screen/widgets/custom_dropdown.dart';
import 'package:todo/module/layout/screen/widgets/header.dart';
import 'package:todo/provider/manager/main_provider.dart';

import '../../../provider/manager/provider_theme.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var providerTheme = Provider.of<ThemeProvider>(context);
    var providerMain = Provider.of<MainProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(title: "settings".tr()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "language".tr(),
                style: theme.textTheme.bodySmall,
              ),
              CustomDropdownBottom(
                selected: providerTheme.initialLanguage == "en" ? 0 : 1,
                getItems: providerTheme.listLang,
                onChange: (items) {
                  providerTheme.funLanguage(items, context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "mode".tr(),
                style: theme.textTheme.bodySmall,
              ),
              CustomDropdownBottom(
                  selected: providerTheme.themeMode == ThemeMode.dark ? 1 : 0,
                  getItems: providerTheme.listTheme,
                  onChange: providerTheme.funThemeData),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "logout".tr(),
                style: theme.textTheme.bodySmall,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      QuickAlert.show(
                          context: context,
                          headerBackgroundColor: Colors.red,
                          title: "logout".tr(),
                          titleColor: theme.colorScheme.inversePrimary,
                          showCancelBtn: true,
                          showConfirmBtn: true,
                          type: QuickAlertType.error,
                          textColor: theme.colorScheme.inversePrimary,
                          text: 'wantLogout'.tr(),
                          confirmBtnText: 'yes'.tr(),
                          cancelBtnText: 'no'.tr(),
                          onConfirmBtnTap: () {
                            return providerMain.logout(context);
                          },
                          borderRadius: 20,
                          onCancelBtnTap: () {
                            Navigator.pop(context);
                          },
                          confirmBtnColor: Colors.redAccent,
                          backgroundColor:
                              theme.colorScheme.secondary);
                    },
                    overlayColor: WidgetStatePropertyAll(
                      theme.colorScheme.primary,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: mediaQueryHeight * 0.069,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: theme.colorScheme.primary),
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "logout".tr(),
                              style: theme.textTheme.bodySmall,
                            ),
                            const Spacer(),
                            ImageIcon(
                              const AssetImage(
                                  "assets/images/icons/logout.png"),
                              color: theme.colorScheme.primary,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
