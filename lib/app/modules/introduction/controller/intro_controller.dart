import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  final box = GetStorage();

  Future introSeen(bool seen) async {
    await box.write("intro", seen);
  }

  bool? getIntroSeen() {
    return box.read("intro");
  }
}
