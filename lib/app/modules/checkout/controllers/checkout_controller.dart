import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/appointment_model.dart';
import '../../../models/payment_method_model.dart';
import '../../../models/payment_model.dart';
import '../../../models/wallet_model.dart';
import '../../../repositories/payment_repository.dart';
import '../../../routes/app_routes.dart';

class CheckoutController extends GetxController {
  late PaymentRepository _paymentRepository;
  final paymentsList = <PaymentMethod>[].obs;
  final walletList = <Wallet>[];
  final isLoading = true.obs;
  final appointment = new Appointment().obs;
  Rx<PaymentMethod> selectedPaymentMethod = new PaymentMethod().obs;

  CheckoutController() {
    _paymentRepository = new PaymentRepository();
  }

  @override
  void onInit() async {
    appointment.value = Get.arguments as Appointment;
    await loadPaymentMethodsList();
    await loadWalletList();
    selectedPaymentMethod.value = this.paymentsList.firstWhere((element) => element.isDefault);
    super.onInit();
  }

  Future loadPaymentMethodsList() async {
    try {
      paymentsList.assignAll(await _paymentRepository.getMethods());
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future loadWalletList() async {
    try {
      var _walletIndex = paymentsList.indexWhere((element) => element.route.toLowerCase() == Routes.WALLET);
      if (_walletIndex > -1) {
        // wallet payment method enabled
        // remove existing wallet method
        var _walletPaymentMethod = paymentsList.removeAt(_walletIndex);
        walletList.assignAll(await _paymentRepository.getWallets());
        // and replace it with new payment method object
        _insertWalletsPaymentMethod(_walletIndex, _walletPaymentMethod);
        paymentsList.refresh();
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  void selectPaymentMethod(PaymentMethod paymentMethod) {
    selectedPaymentMethod.value = paymentMethod;
  }

  void payAppointment(Appointment _appointment) async {
    try {
      _appointment.payment = new Payment(paymentMethod: selectedPaymentMethod.value);
      Get.toNamed(selectedPaymentMethod.value.route.toLowerCase(),
          arguments: {'appointment': Appointment(id: _appointment.id, payment: _appointment.payment), 'wallet': selectedPaymentMethod.value.wallet});
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  TextStyle getTitleTheme(PaymentMethod paymentMethod) {
    if (paymentMethod == selectedPaymentMethod.value) {
      return Get.textTheme.bodyMedium!.merge(TextStyle(color: Get.theme.primaryColor));
    } else if (paymentMethod.wallet != null && paymentMethod.wallet!.balance < appointment.value.getTotal()) {
      return Get.textTheme.bodyMedium!.merge(TextStyle(color: Get.theme.focusColor));
    }
    return Get.textTheme.bodyMedium!;
  }

  TextStyle getSubTitleTheme(PaymentMethod paymentMethod) {
    if (paymentMethod == selectedPaymentMethod.value) {
      return Get.textTheme.bodySmall!.merge(TextStyle(color: Get.theme.primaryColor));
    }
    return Get.textTheme.bodySmall!;
  }

  Color? getColor(PaymentMethod paymentMethod) {
    if (paymentMethod == selectedPaymentMethod.value) {
      return Get.theme.colorScheme.secondary;
    }
    return null;
  }

  void _insertWalletsPaymentMethod(int _walletIndex, PaymentMethod _walletPaymentMethod) {
    walletList.forEach((_walletElement) {
      paymentsList.insert(
          _walletIndex,
          new PaymentMethod(
            isDefault: _walletPaymentMethod.isDefault,
            id: _walletPaymentMethod.id,
            name: _walletElement.name,
            description: _walletElement.balance.toString(),
            logo: _walletPaymentMethod.logo,
            route: _walletPaymentMethod.route,
            wallet: _walletElement,
          ));
    });
  }
}
