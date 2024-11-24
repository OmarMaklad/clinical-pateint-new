import 'package:get/get.dart';

import '../controllers/blogs_controller.dart';

class BlogBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(
      () => BlogController(),
    );
  }
}
