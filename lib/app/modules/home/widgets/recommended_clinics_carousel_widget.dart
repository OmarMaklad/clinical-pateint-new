/*
 * File name: recommended_clinics_carousel_widget.dart
 * Last modified: 2022.02.11 at 01:33:14
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../clinic/controllers/clinic_controller.dart';
import '../../global_widgets/clinic_availability_badge_widget.dart';
import '../controllers/home_controller.dart';
import 'clinic_main_thumb_widget.dart';
import 'clinic_thumbs_widget.dart';

class RecommendedClinicsCarouselWidget extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      child: Obx(() {
        return ListView.builder(
            padding: EdgeInsets.only(bottom: 18),
            primary: false,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: controller.clinics.length,
            itemBuilder: (_, index) {
              var _clinic = controller.clinics.elementAt(index);
              return GestureDetector(
                onTap: () {
                  Get.put(ClinicController());
                  Get.find<ClinicController>().clinic.value = _clinic;
                  Get.find<ClinicController>().heroTag =
                      'recommended_carousel' + _clinic.id;
                  Get.toNamed(Routes.CLINIC)?.then((value) =>
                      Get.find<HomeController>().getRecommendedClinics());
                  _clinic.views++;
                  Get.find<ClinicController>().incrementViews();
                  // Get.find<ClinicController>().getClinic();
                },
                child: Container(
                  width: 280,
                  margin: EdgeInsetsDirectional.only(
                      end: 20, start: index == 0 ? 20 : 0, top: 20, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Get.theme.focusColor.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClinicMainThumbWidget(clinic: _clinic),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Get.theme.hintColor.withOpacity(0.6)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20,
                                      color: Colors.grey[400],
                                    ),
                                    Text(
                                      ' ${_clinic.views} ',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          height: 1.5,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      ClinicThumbsWidget(clinic: _clinic),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _clinic.name ?? '',
                              maxLines: 2,
                              style: Get.textTheme.bodyMedium?.merge(
                                  TextStyle(color: Get.theme.hintColor)),
                            ),

                            // Text(
                            //   Ui.getDistance(_clinic.distance),
                            //   style: Get.textTheme.bodyLarge,
                            // ),
                            // SizedBox(height: 8),
                            Wrap(
                              spacing: 5,
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                Wrap(
                                  children: Ui.getStarsList(_clinic.rate),
                                ),
                                ClinicAvailabilityBadgeWidget(clinic: _clinic),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
