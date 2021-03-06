import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathone/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:hackathone/Screen/Components/colors.dart';
import 'package:hackathone/Screen/Components/configration.dart';
import 'package:hackathone/Screen/Home%20Screen/home_screen.dart';

Widget drawer() {
  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dpimg),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
            ),
          ),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //backgroun profile image
              Container(
                height: 120,
                width: 120,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: white,
                    width: 3,
                  ),
                  image: DecorationImage(
                    image: AssetImage(dpimg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                child: Text(
                  "MUHAMMAD ATHAR",
                  style: TextStyle(
                    color: white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
        const MenuBtn(),
      ],
    ),
  );
}

class MenuBtn extends StatefulWidget {
  const MenuBtn({Key? key}) : super(key: key);

  @override
  _MenuBtnState createState() => _MenuBtnState();
}

class _MenuBtnState extends State<MenuBtn> {
  final indexcontroller = Get.find<IndexController>();
  List<bool> isselected = [true, false, false];
  final padding = const EdgeInsets.only(top: 15, left: 15);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: ListTile(
            leading: Icon(
              Icons.favorite,
              color: primary,
            ),
            title: Text(
              "Car list",
              style: btntxt,
            ),
            onTap: () {
              indexcontroller.updateindex(1);
              Get.back();
              Get.to(HomeScreen());
            },
          ),
        ),
        Padding(
          padding: padding,
          child: ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: primary,
            ),
            title: Text(
              "Cart Item",
              style: btntxt,
            ),
            onTap: () {
              indexcontroller.updateindex(2);
              Get.back();
              Get.to(HomeScreen());
            },
          ),
        ),
        Padding(
          padding: padding,
          child: ListTile(
            leading: Icon(
              Icons.task,
              color: primary,
            ),
            title: Text(
              "Book",
              style: btntxt,
            ),
            onTap: () {
              indexcontroller.updateindex(3);
              Get.back();
              Get.to(HomeScreen());
            },
          ),
        ),
        Padding(
          padding: padding,
          child: ListTile(
            leading: Icon(
              Icons.person,
              color: primary,
            ),
            title: Text(
              "Profile",
              style: btntxt,
            ),
            onTap: () {
              indexcontroller.updateindex(3);
              Get.back();
              Get.to(HomeScreen());
            },
          ),
        ),
        Padding(
          padding: padding,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              color: primary,
            ),
            title: Text(
              "Setting",
              style: btntxt,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

final btntxt = TextStyle(
  color: primary,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
