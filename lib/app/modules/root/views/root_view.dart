import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_bottom_nav_bar.dart';
import '../../global_widgets/main_drawer_widget.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawer: MainDrawerWidget(),
        body: controller.currentPage,
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_outlined,
              label: "Home".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.assignment_outlined,
              label: "Appointments".tr,
            ),
            // CustomBottomNavigationItem(
            //   icon: Icons.book,
            //   label: "Blogs".tr,
            // ),
            CustomBottomNavigationItem(
              icon: Icons.group_outlined,
              label: "Patients".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.person_outline,
              label: "Account".tr,
            ),
          ],
        ),
      );
    });
  }
}
