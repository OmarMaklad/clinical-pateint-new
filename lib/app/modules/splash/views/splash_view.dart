import 'dart:async';
import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_routes.dart';
import '../../introduction/controller/intro_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  navigate() async {
    // FirebaseMessaging.instance.getToken().then((token) {
    // });
    //

    Get.lazyPut<IntroController>(
      () => IntroController(),
    );
    bool? isSeen = Get.find<IntroController>().getIntroSeen() ?? false;
    Timer(const Duration(seconds: 6), () {
      if (isSeen) {
        Get.offAndToNamed(Routes.ROOT);
      } else {
        Get.offAndToNamed(Routes.INTRODUCTION);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  void didChangeDependencies() {
    ///forground work
    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {}
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFF),
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: Image.asset('assets/animation/Clinical_Loader.gif')
              // Lottie.asset(
              //   'assets/animation/logo2.json',
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
