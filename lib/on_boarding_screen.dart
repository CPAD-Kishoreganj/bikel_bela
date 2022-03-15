import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'screens/product_overview_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const route = '/on-boarding-screen';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "This is first Onboarding screen",
          body: "Onboarding screen body text",
          image: Image.asset('assets/ebook.png'),
        ),
        PageViewModel(
          title: "This is second Onboarding screen",
          body: "Onboarding screen body text",
          image: Image.asset('assets/learn.png'),
        ),
        PageViewModel(
          title: "This is third Onboarding screen",
          body: "Onboarding screen body text",
          image: Image.asset('assets/manthumbs.png'),
        ),
        PageViewModel(
          title: "This is fourth Onboarding screen",
          body: "Onboarding screen body text",
          image: Image.asset('assets/readingbook.png'),
        ),
      ],
      done: Text("Done"),
      next: Icon(Icons.arrow_forward),
      onDone: () {
        Navigator.of(context).pushReplacementNamed(ProductOverviewScreen.route);
      },
    );
  }
}
