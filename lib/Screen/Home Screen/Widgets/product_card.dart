import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathone/Api%20Services/api_service.dart';
import '../../Components/colors.dart';
import '../../Detailed Screen/detail_screen.dart';
import '../../Favorite/controller.dart';
import '../Components/controllers.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final apicontroller = Get.find<ApiServices>();
  final productcontroller = Get.put(ProductController());
  final favaritecontroller = Get.put(FavoriteController());
  String name = '';
  String brand = '';
  String imagepath = '';
  String price = '';
  String cate = '';
  String rating = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apicontroller.fetchProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(child: const CircularProgressIndicator());
          } else {
            return Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const ScrollPhysics(parent: null),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: boxdecoration(),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                alignment: Alignment.topCenter,
                                child: Image.network(
                                  snapshot.data[index].imagepath,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 10),
                                child: Text(
                                  snapshot.data[index].rent,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                child: Text(
                                  "Rs.${snapshot.data[index].car}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.to(DetailScreen(
                                        carlist: productcontroller
                                            .productlist[index]));
                                  },
                                  icon: Icon(Icons.navigate_next_outlined))
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            );
          }
        });
  }
}

String productbackimg = "assets/images/back3.png";
BoxDecoration boxdecoration() {
  return BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: boxshadow2,
    image: DecorationImage(
      scale: 1,
      image: AssetImage(productbackimg),
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(white.withOpacity(0.7), BlendMode.lighten),
    ),
  );
}
