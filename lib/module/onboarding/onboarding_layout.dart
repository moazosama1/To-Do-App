import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/provider/manager/provider_onboarding.dart';

class OnboardingLayout extends StatelessWidget {
  static const String routeName = "onboarding";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => OnboardingProvider(),
        child: Consumer<OnboardingProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: provider.pageController,
                    onPageChanged: provider.onChangePage,
                    children: provider.onboardingPages,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SmoothPageIndicator(
                          controller: provider.pageController, // PageController
                          count: 3,
                          effect: WormEffect(
                            spacing: 15,
                            radius: 20.0,
                            dotWidth: 8.0,
                            dotHeight: 15.0,
                            paintStyle: PaintingStyle.stroke,
                            strokeWidth: 1.5,
                            dotColor: theme.colorScheme.primary,
                          ),
                          onDotClicked: (index) {
                            provider.pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        overlayColor:const WidgetStatePropertyAll(Colors.transparent),
                        onTap: () {
                          provider.currentPage ==
                                  provider.onboardingPages.length - 1
                              ? provider.pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut)
                              : provider.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                        },
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              provider.currentPage !=
                                      provider.onboardingPages.length - 1
                                  ? Icons.navigate_next
                                  : Icons.navigate_before,
                              color: Colors.white,
                              size: 50,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
