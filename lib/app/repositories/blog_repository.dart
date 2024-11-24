import 'package:get/get.dart';

import '../models/blog_category_model.dart';
import '../models/blog_model.dart';
import '../models/doctor_model.dart';
import '../models/experience_model.dart';
import '../models/favorite_model.dart';
import '../models/option_group_model.dart';
import '../models/review_model.dart';
import '../providers/laravel_provider.dart';

class BlogRepository {
  late LaravelApiClient _laravelApiClient;

  BlogRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<Blog>> getAllBlogs({int page = 1}) {
    return _laravelApiClient.getAllBlogsWithPagination();
  }

  Future<List<BlogCategory>> getCategories() {
    return _laravelApiClient.getAllCategories();
  }

  Future<List<Blog>> getBlogById(int categoryId, {int page = 1}) {
    return _laravelApiClient.getBlogsById(categoryId);
  }


}
