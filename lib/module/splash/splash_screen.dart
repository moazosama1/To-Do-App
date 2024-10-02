import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/auth/page/login.dart';
import 'package:todo/module/layout/layout_screen.dart';
import 'package:todo/module/onboarding/onboarding_layout.dart';
import 'package:todo/provider/manager/provider_theme.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
        () => FirebaseAuth.instance.currentUser != null
            ? Navigator.pushNamedAndRemoveUntil(
                context, LayoutScreen.routeName, (route) => false)
            : Navigator.pushNamedAndRemoveUntil(
                context, OnboardingLayout.routeName, (route) => false));
    return Scaffold(
      body: Center(
        child: ZoomIn(
            duration: const Duration(seconds: 2),
            child:
                const Image(image: AssetImage("assets/images/logo/logo.png"))),
      ),
    );
  }
}
