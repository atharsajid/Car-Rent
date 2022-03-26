import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Cart Screen/cart_list_controller.dart';
import '../Components/colors.dart';
import 'Widgets/app_bar_widget.dart';
import 'Widgets/brand_name.dart';
import 'Widgets/product_card.dart';

class MainHomeScree extends StatelessWidget {
  final cartcontroller = Get.put(
    CartController(),
  );

  double borderradius = 32;

  MainHomeScree({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: backgroundgray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderradius),
          topRight: Radius.circular(borderradius),
        ),
      ),
      child: Column(
        children: [
          // brandandprod("Choose Brand"),
          // const SizedBox(
          //   height: 110,
          //   child: BranName(),
          // ),
          brandandprod("Beats Products"),
          const ProductCard(),
        ],
      ),
    );
  }
}
