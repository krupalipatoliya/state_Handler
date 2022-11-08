import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/utils/string.dart';

import '../controllers/productcontroller.dart';
import '../models/products.dart';
import '../utils/colours.dart';
import '../utils/global.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: black7,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: green,
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: lightGreen.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        CupertinoIcons.location_solid,
                        color: green,
                        size: 25,
                      ),
                      Text(
                        foodDetails,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: lightGreen.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Provider.of<ProductController>(context, listen: false)
                              .likeProduct(product: products[product.id + 1]);
                        },
                        icon: (product.isLike == "true")
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_border,
                                color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //White Container
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Container(
                height: 540,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 29),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$${product.price}0",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: green),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.orangeAccent,
                                size: 27,
                              ),
                              Text(
                                " 4.2",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.bloodtype_rounded,
                                color: Colors.red,
                                size: 27,
                              ),
                              Text(
                                " 100 Kcal",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.access_time,
                                color: Colors.orangeAccent,
                                size: 27,
                              ),
                              Text(
                                " 20min",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "About food ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 29),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        dummyContain,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.pushNamed(context, "/");
                          },
                          child: Ink(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  addToCart,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Image.network(
                product.image,
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
