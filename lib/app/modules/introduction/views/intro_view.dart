
import 'package:doctors_appointments/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../controller/intro_controller.dart';

class IntroView extends StatefulWidget {
@override
_IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        useScrollView: false,
        body: '',
        titleWidget: Column(
          children: [
            Image.asset(
              "assets/img/intro1.png",
            ),
          ],
        ),
      ),
      PageViewModel(
        useScrollView: false,
        body: '',
        titleWidget: Column(
          children: [
            Image.asset(
              "assets/img/intro2.png",
            ),
          ],
        ),
      ),
      PageViewModel(
        useScrollView: false,
        body: '',
        titleWidget: Column(
          children: [
            Image.asset(
              "assets/img/intro3.png",
            ),
          ],
        ),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<IntroController>().introSeen(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

      ),
      body: IntroductionScreen(
        globalBackgroundColor: Color(0xffF7F7F7),
        dotsDecorator: DotsDecorator(
            activeShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(2), left: Radius.circular(2)),
            ),
            color: Get.theme.colorScheme.secondary.withOpacity(0.4),
            activeColor: Get.theme.colorScheme.secondary),
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        next: Container(
          margin: EdgeInsets.only(left: 60),
          child: Icon(
            Icons.arrow_forward,
            color: Get.theme.colorScheme.secondary,
          ),
        ),
        onDone: () {
          Get.offAndToNamed(Routes.ROOT);
        },
        skip: Container(
          margin: EdgeInsets.only(right: 0),
          child: Text(('skip'.tr),
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1,
                  color: Get.theme.colorScheme.secondary)),
        ),
        done: Container(
          margin: EdgeInsets.only(left: 0),
          child: Text(('done'.tr),
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1,
                  color: Get.theme.colorScheme.secondary)),
        ),
      ),
    );
  }
}