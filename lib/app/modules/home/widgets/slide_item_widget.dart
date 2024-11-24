import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../common/ui.dart';
import '../../../models/slide_model.dart';
import '../../../routes/app_routes.dart';
import '../../clinic/controllers/clinic_controller.dart';
import '../../clinic/controllers/clinic_controller.dart';
import '../../doctor/controllers/doctor_controller.dart';

class SlideItemWidget extends StatelessWidget {
  final Slide slide;

  const SlideItemWidget({
    required this.slide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (slide.type == 'doctor' && slide.doctorId != null) {
          Get.put(DoctorController());
          final doctorController = Get.find<DoctorController>();
          EasyLoading.show(status: 'loading...');
          await doctorController.getDoctorById('${slide.doctorId}');
          Get.toNamed(Routes.DOCTOR,
              arguments: {'doctor': slide.doctor, 'heroTag': 'slide_item'});
          EasyLoading.dismiss();
        } else if (slide.type == 'clinic' && slide.clinicId != null) {
          Get.put(ClinicController());
          final clinicController = Get.find<ClinicController>();
          EasyLoading.show(status: 'loading...');
          await clinicController.getClinicById('${slide.clinicId}');
          Get.toNamed(Routes.CLINIC, arguments: {
            'clinic': slide.clinic,
            'heroTag': 'clinic_slide_item'
          });
          EasyLoading.dismiss();
        } else if (slide.type == 'offer'
            && slide.offerLink != null) {
          launchUrlString(slide.offerLink!);
        }

      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(
            Directionality.of(context) == TextDirection.rtl ? math.pi : 0),
        child: CachedNetworkImage(
          width: double.infinity,
          height: 310,
          fit: BoxFit.fitWidth,
          imageUrl: slide.image.url,
          placeholder: (context, url) =>
              Image.asset(
                'assets/img/loading.gif',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
          errorWidget: (context, url, error) => Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
