import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/favorite_model.dart';
import '../../../providers/laravel_provider.dart';
import '../../clinic/widgets/doctors_empty_list_widget.dart';
import '../../clinic/widgets/doctors_list_loader_widget.dart';
import 'favorites_list_item_widget.dart';

class FavoritesListWidget extends StatelessWidget {
  final List<Favorite> favorites;

  FavoritesListWidget({Key? key, required List<Favorite> this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<LaravelApiClient>().isLoading(task: 'getFavoritesDoctors')) {
        return ServicesListLoaderWidget();
      } else if (favorites.isEmpty) {
        return DoctorsEmptyListWidget();
      } else {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          primary: false,
          shrinkWrap: true,
          itemCount: favorites.length,
          itemBuilder: ((_, index) {
            var _favorite = favorites.elementAt(index);
            return FavoritesListItemWidget(favorite: _favorite);
          }),
        );
      }
    });
  }
}
