import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathone/Api%20Services/api_service.dart';

import '../Cart Screen/cart_list_controller.dart';
import '../Components/colors.dart';
import '../Detailed Screen/controllers.dart';
import '../Drawer/drawer.dart';
import 'Widgets/app_bar_widget.dart';
import 'Widgets/bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  
  final colorcontroller = Get.put(
    Colorcontroller(),
  );
   final apicontroller = Get.put(
    ApiServices(),
  );
  final indexcontroller = Get.put(
    IndexController(),
  );

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: drawer(),
      body: GetBuilder<IndexController>(
        builder: (controller) {
          return screens[controller.currentind];
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        foregroundColor: white,
        onPressed: () {
          indexcontroller.updateindex(2);
        },
        child: const Icon(
          Icons.shopping_bag_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottomappbar(),
    );
  }
}
