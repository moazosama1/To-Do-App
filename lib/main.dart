import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/theme_app/app_theme.dart';
import 'package:todo/module/auth/page/create_account.dart';
import 'package:todo/module/layout/layout_screen.dart';
import 'package:todo/module/layout/screen/edit_task_screen.dart';
import 'package:todo/module/onboarding/onboarding_layout.dart';
import 'package:todo/provider/manager/provider_theme.dart';
import 'firebase_options.dart';
import 'module/auth/page/login.dart';
import 'module/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(prefsLocale: sharedPref, prefsTheme: sharedPref),
    child: Builder(
      builder: (context) {
        var provider = Provider.of<ThemeProvider>(context);
        return EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          startLocale: Locale(provider.initialLanguage),
          child: MyApplication(),
        );
      },
    ),
  ));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: "ToDo",
      theme: AppTheme.lightTheme(isArabic: provider.initialLanguage == "ar"),
      darkTheme: AppTheme.darkTheme(isArabic: provider.initialLanguage == "ar"),
      themeMode: provider.themeMode,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        CreateAccount.routeName: (_) => CreateAccount(),
        LoginScreen.routeName: (_) => LoginScreen(),
        EditTask.routeName: (_) => EditTask(),
        LayoutScreen.routeName: (_) => LayoutScreen(),
        OnboardingLayout.routeName: (_) => OnboardingLayout(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

