import 'dart:async';

import '../../../models/blog_category_model.dart';
import '../../../repositories/blog_repository.dart';
import '../../../../common/ui.dart';
import 'package:get/get.dart';

import '../../../models/blog_model.dart';

class BlogController extends GetxController {
  late BlogRepository _blogRepository;
  final blogs = <Blog>[].obs;
  final categories = <BlogCategory>[].obs;
  Rx<BlogCategory>? selectedCategory = BlogCategory().obs;
  final loading = false.obs;

  BlogController() {
    _blogRepository = new BlogRepository();
  }

  @override
  void onInit() async {
    super.onInit();
    getCategories();
    getBlogs();
  }

  Future getCategories() async {
    try {
      categories.value = await _blogRepository.getCategories();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getBlogs() async {
    try {
      blogs.value = await _blogRepository.getAllBlogs();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getBlogById() async {
    try {
      blogs.value =
          await _blogRepository.getBlogById(selectedCategory?.value.id  ?? 0);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
