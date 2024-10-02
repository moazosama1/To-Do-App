import 'package:flutter/material.dart';

import '../../module/onboarding/page/first_page.dart';
import '../../module/onboarding/page/second_page.dart';
import '../../module/onboarding/page/third_page.dart';

class OnboardingProvider extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  List<Widget> onboardingPages = [
    FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];
  int currentPage = 0;
  onChangePage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
