import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathone/Screen/Cart%20Screen/cart_screen.dart';
import 'package:hackathone/Screen/Components/colors.dart';
import 'package:hackathone/Screen/Components/configration.dart';
import 'package:hackathone/Screen/Home%20Screen/Widgets/app_bar_widget.dart';
import 'package:hackathone/Screen/Home%20Screen/Widgets/product_card.dart';
import 'package:hackathone/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:hackathone/Screen/Home%20Screen/home_screen.dart';
import 'package:hackathone/Screen/Splash%20Screen/splash_screen.dart';

import '../../Api Services/model.dart';

class DetailScreen extends StatefulWidget {
  final CarList carlist;

  DetailScreen({Key? key, required this.carlist}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final cartcontroller = Get.put(CartController());

  final indexcontroller = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    double borderradius = 32;

    return Scaffold(
      appBar: detailpageappbar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: boxDecoration(borderradius, backgroundgray),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: decoration(),
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                  children: [
                    Image.network(
                      widget.carlist.imagepath.toString(),
                      height: 200,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 40,
                      child: star(),
                    ),
                    nametxt(widget.carlist.brand.toString()),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    pricetext(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                width: double.infinity,
                decoration: boxDecoration(borderradius, white),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(parent: null),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        nametxt('Category'),
                        Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          height: 55,
                          child: Text(widget.carlist.category.toString()),
                        ),
                        nametxt(widget.carlist.rent.toString()),
                        Text(
                          "Confirm to ride ",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 0),
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: twobutton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//widgets call in above class are following below
  Widget nametxt(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }

//star widget
  Widget star() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 25,
            )
          ],
        );
      },
    );
  }

//grey rounded background
  BoxDecoration boxDecoration(double borderradius, Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderradius),
        topRight: Radius.circular(borderradius),
      ),
    );
  }

//for product background imge
  decoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(productbackimg),
        colorFilter: ColorFilter.mode(
          white.withOpacity(0.5),
          BlendMode.dstIn,
        ),
        fit: BoxFit.contain,
      ),
    );
  }

//Price widget
  Widget pricetext() {
    return Text(
      "Rs. ${widget.carlist.car.toString()}",
      style: TextStyle(
        color: primary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

//add to cart and buy now button widget
  Widget twobutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 50),
              primary: backgroundgray,
              onPrimary: Colors.black.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              )),
          onPressed: () {},
          child: const Text(
            "Add to Cart",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 50),
              primary: primary,
              onPrimary: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              )),
          onPressed: () {
            Get.to(SplashScreen());
          },
          child: const Text(
            "Book Now",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

//appbar widget
  detailpageappbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: black,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primary,
          )),
      title: Container(
        alignment: Alignment.center,
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconimg,
              height: 50,
            ),
            Text(
              companyname,
              style: TextStyle(
                  fontSize: 24,
                  color: primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ],
        ),
      ),
      actions: [
        GetX<CartController>(
          builder: (controller) {
            return Center(
              child: controller.cartlist.isNotEmpty
                  ? Text(
                      controller.cartlist.length.toString(),
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(
                      width: 0,
                    ),
            );
          },
        ),
        IconButton(
            onPressed: () {
              indexcontroller.updateindex(2);
              Get.to(
                HomeScreen(),
              );
            },
            icon: Icon(
              Icons.shopping_bag_sharp,
              color: primary,
            )),
      ],
    );
  }
}

const colorlist = [Colors.blue, Colors.pink, Colors.orange];
