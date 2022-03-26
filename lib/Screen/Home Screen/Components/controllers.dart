import 'package:get/get.dart';
import 'package:hackathone/Api%20Services/model.dart';
import '../Models/models.dart';

class BrandNameController extends GetxController {
  var brandnamelist = <BrandNameModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchproduct();
  }

  void fetchproduct() {
    brandnamelist.value = brandName;
  }
}

//main product controller
class ProductController extends GetxController {
  var productlist = <CarList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchproduct();
  }

  void fetchproduct() {
    productlist.value = cars;
  }
}

//colot controller
class FavIconColor extends GetxController {
  var isfavorite = false.obs;
}
