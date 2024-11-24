import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_appointments/app/modules/global_widgets/notifications_button_widget.dart';
import 'package:doctors_appointments/app/routes/app_routes.dart';
import 'package:doctors_appointments/app/services/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/ui.dart';
import '../../../models/blog_model.dart';
import '../../../providers/laravel_provider.dart';
import '../controllers/blogs_controller.dart';

class BlogsView extends GetView<BlogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Get.theme.primaryColor),
        title: Text(
          "Blogs".tr,
          style: Get.textTheme.titleLarge,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Colors.black87),
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
        actions: [NotificationsButtonWidget()],
      ),
      body: Obx(() => Column(
            children: [
              Container(
                height: 60,
                child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children:
                        List.generate(controller.categories.length, (index) {
                      var _category = controller.categories.elementAt(index);
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20),
                        child: RawChip(
                          elevation: 0,
                          label: Text(_category.name ?? ''),
                          labelStyle:
                              controller.selectedCategory?.value == _category
                                  ? Get.textTheme.bodyMedium?.merge(
                                      TextStyle(color: Get.theme.primaryColor))
                                  : Get.textTheme.bodyMedium,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          backgroundColor:
                              Theme.of(context).focusColor.withOpacity(0.1),
                          selectedColor: Color(0xff135685),
                          selected:
                              controller.selectedCategory?.value == _category,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          showCheckmark: true,
                          checkmarkColor: Get.theme.primaryColor,
                          onSelected: (bool value) {
                            controller.selectedCategory?.value = _category;
                            controller.getBlogById();
                          },
                        ),
                      );
                    })),
              ),
              Expanded(
                child:
                controller.blogs.isEmpty?
                    Center(child: Text('No data found')):
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.blogs.length + 1,
                  itemBuilder: ((_, index) {
                    if (index == controller.blogs.length) {
                      return Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Center(
                            child: new Opacity(
                              opacity: controller.loading.value ? 1 : 0,
                              child: new CircularProgressIndicator(),
                            ),
                          ),
                        );
                      });
                    } else {
                      var _blog = controller.blogs.elementAt(index);
                      return BlogItem(blog: _blog);
                    }
                  }),
                ),
              ),
            ],
          )),
    );
  }
}

class BlogItem extends StatelessWidget {
  const BlogItem({
    Key? key,
    required Blog blog,
  })  : _blog = blog,
        super(key: key);

  final Blog _blog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.BLOGS_DETAILS, arguments: _blog);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: Ui.getBoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Hero(
                  tag: _blog.id.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: CachedNetworkImage(
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      imageUrl: _blog.image ?? '',
                      placeholder: (context, url) => Image.asset(
                        'assets/img/loading.gif',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 80,
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error_outline),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Wrap(
                runSpacing: 1,
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        _blog.title ?? '',
                        style: Get.textTheme.bodyMedium,
                        maxLines: 3,
                        // textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  Divider(height: 8, thickness: 1),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 18,
                        color: Get.theme.focusColor,
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                        height: 50,
                        width: 200,

                        child: Html(data: _blog.description,
                            style: {
                          "table": Style(
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          // some other granular customizations are also possible
                          "tr": Style(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "th": Style(
                            padding: EdgeInsets.all(6),
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor: Colors.grey,
                          ),
                          "td": Style(
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                            padding: EdgeInsets.all(6),
                            // alignment: Alignment.topLeft,
                          ),
                          // text that renders h1 elements will be red
                          "h1": Style(
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "h2": Style(
                            fontSize: FontSize.larger,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "h3": Style(
                            fontSize: FontSize.larger,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "h4": Style(
                            fontSize: FontSize.larger,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "h5": Style(
                            fontSize: FontSize.larger,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                          "h6": Style(
                            fontSize: FontSize.larger,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            // backgroundColor:
                            // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                          ),
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DoctorsListWidget extends GetView<BlogController> {
//   DoctorsListWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (Get.find<LaravelApiClient>().isLoading(tasks: [
//         'getClinicDoctors',
//         'getClinicPopularDoctors',
//         'getClinicMostRatedDoctors',
//         'getClinicAvailableDoctors',
//         'getClinicFeaturedDoctors'
//       ]) &&
//           controller.page == 1) {
//         return ServicesListLoaderWidget();
//       } else if (controller.doctors.isEmpty) {
//         return DoctorsEmptyListWidget();
//       } else {
//         return ListView.builder(
//           padding: EdgeInsets.only(bottom: 10, top: 10),
//           primary: false,
//           shrinkWrap: true,
//           itemCount: controller.doctors.length + 1,
//           itemBuilder: ((_, index) {
//             if (index == controller.doctors.length) {
//               return Obx(() {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: new Center(
//                     child: new Opacity(
//                       opacity: controller.isLoading.value ? 1 : 0,
//                       child: new CircularProgressIndicator(),
//                     ),
//                   ),
//                 );
//               });
//             } else {
//               var _doctor = controller.doctors.elementAt(index);
//               return DoctorsListItemWidget(doctor: _doctor);
//             }
//           }),
//         );
//       }
//     });
//   }
// }
