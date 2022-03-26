import 'package:get/get.dart';

import '../Home Screen/Models/models.dart';

class FavoriteController extends GetxController {
  var favoritelist = <Products>[].obs;

  addtofav(Products product) {
    favoritelist.add(product);
  }
}
