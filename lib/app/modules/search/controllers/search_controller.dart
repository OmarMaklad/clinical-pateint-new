import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/speciality_model.dart';
import '../../../models/doctor_model.dart';
import '../../../repositories/speciality_repository.dart';
import '../../../repositories/doctor_repository.dart';

class SearchController extends GetxController {
  final heroTag = "".obs;
  final specialities = <Speciality>[].obs;
  final emirates = <String>[
    'dubai',
    'abu dhabi',
    'sharjah',
    'ajman',
    'fujairah',
    'umm al quwain',
    'ras al khaimah',
  ].obs;
  final selectedEmirates = <String>[].obs;
  final selectedSpecialities = <String>[].obs;
  final selectedInsurances = <String>[].obs;
  late TextEditingController textEditingController;

  final doctors = <Doctor>[].obs;
  late DoctorRepository _doctorRepository;
  late SpecialityRepository _specialityRepository;

  SearchController() {
    _doctorRepository = new DoctorRepository();
    _specialityRepository = new SpecialityRepository();
    textEditingController = new TextEditingController();
  }

  @override
  void onInit() async {
    await refreshSearch();
    super.onInit();
  }

  @override
  void onReady() {
    heroTag.value = Get.arguments as String;
    super.onReady();
  }

  Future refreshSearch({bool? showMessage}) async {
    await getSpecialities();
    await searchDoctors();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "List of doctors refreshed successfully".tr));
    }
  }

  Future searchDoctors({String? keywords}) async {
    try {
      if (selectedSpecialities.isEmpty) {
        doctors.assignAll(await _doctorRepository.search(
          keywords,
          specialities.map((element) => element.id).toList(),
          emirates: selectedEmirates.toList(),
          insurances: selectedInsurances.toList(),
        ));
      } else {
        doctors.assignAll(await _doctorRepository.search(
          keywords,
          selectedSpecialities.toList(),
          emirates: selectedEmirates.toList(),
          insurances: selectedInsurances.toList(),
        ));
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getSpecialities() async {
    try {
      specialities.assignAll(await _specialityRepository.getAllParents());
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  bool isSelectedSpeciality(Speciality speciality) {
    return selectedSpecialities.contains(speciality.id);
  }

  void toggleSpeciality(bool value, Speciality speciality) {
    if (value) {
      selectedSpecialities.add(speciality.id);
    } else {
      selectedSpecialities.removeWhere((element) => element == speciality.id);
    }
  }

  bool isSelectedEmirate(String emirate) {
    return selectedEmirates.contains(emirate);
  }

  void toggleEmirate(bool value, String emirate) {
    if (value) {
      selectedEmirates.add(emirate);
    } else {
      selectedEmirates.removeWhere((element) => element == emirate);
    }
  }

  bool isSelectedInsurance(String insuranceId) {
    return selectedInsurances.contains(insuranceId);
  }

  void toggleInsurance(bool value, String insuranceId) {
    if (value) {
      selectedInsurances.add(insuranceId);
    } else {
      selectedInsurances.removeWhere((element) => element == insuranceId);
    }
  }
}
