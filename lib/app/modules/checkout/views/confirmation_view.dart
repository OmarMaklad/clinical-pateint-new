import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/block_button_widget.dart';
import '../../global_widgets/main_drawer_widget.dart';
import "../../root/controllers/root_controller.dart";
import '../controllers/checkout_controller.dart';

class ConfirmationView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments ?? {};
    return Scaffold(
      drawer: MainDrawerWidget(),
      appBar: AppBar(
        title: Text(
          arguments['title'] ?? "Confirmation".tr,
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Get.theme.hintColor),
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
        elevation: 0,
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'assets/img/success.png',
            ),
            Text(
              arguments['short_message'] ?? "Thank you!".tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.displaySmall,
            ),
            SizedBox(height: 10),
            Opacity(
              opacity: 0.3,
              child: Text(
                arguments['long_message'] ??
                    "Your appointment has been successfully submitted, you will receive a confirmation soon"
                        .tr,
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 150),
            Image.asset(
              'assets/icon/home_logo.png',
              height: 80,
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBlockButtonWidget(),
    );
  }

  Widget buildBlockButtonWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5)),
        ],
      ),
      child: BlockButtonWidget(
          text: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "My Appointments".tr,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleLarge?.merge(
                    TextStyle(color: Get.theme.primaryColor),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  color: Get.theme.primaryColor, size: 20)
            ],
          ),
          color: Get.theme.colorScheme.secondary,
          onPressed: () {
            Get.find<RootController>().changePage(1);
          }).paddingOnly(bottom: 20, right: 20, left: 20),
    );
  }
}
