import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/utils/string.dart';

import '../controllers/database_provider.dart';
import '../controllers/productcontroller.dart';
import '../models/products.dart';
import '../utils/colours.dart';
import '../utils/global.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  TextEditingController searchController = TextEditingController();
  String search = "";

  bool tab1 = true;
  bool tab2 = false;
  bool tab3 = false;
  bool tab4 = false;
  late Future<RxList<Product>> productDataList;
  late Future<List<Product>> productList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = ProductDBHelper.productDBHelper.fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: green,
                      size: 25,
                    ),
                    Text(
                      " Magura, BD",
                      style: TextStyle(color: black2, fontSize: 19),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "data:image/jpeg;base64,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"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hello",
              style: TextStyle(
                  color: green, fontSize: 25, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              findYourFood,
              style: TextStyle(
                  color: black2, fontWeight: FontWeight.w900, fontSize: 30),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: searchController,
              textInputAction: TextInputAction.done,
              onSaved: (val) {
                setState(() {
                  search = val!;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter Some value";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGreen,
                border: InputBorder.none,
                hintText: "Search Food",
                hintStyle: const TextStyle(fontSize: 18),
                prefixIcon: const Icon(
                  Icons.search,
                  color: green,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                suffixIcon: Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.filter_list_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      setState(() {
                        tab1 = true;
                        tab2 = false;
                        tab3 = false;
                        tab4 = false;
                      });
                    },
                    child: Text(
                      food,
                      style: TextStyle(
                        color: (tab1) ? green : black4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        tab1 = false;
                        tab2 = true;
                        tab3 = false;
                        tab4 = false;
                      });
                    },
                    child: Text(
                      fruits,
                      style: TextStyle(
                        color: (tab2) ? green : black4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        tab1 = false;
                        tab2 = false;
                        tab3 = true;
                        tab4 = false;
                      });
                    },
                    child: Text(
                      vegetables,
                      style: TextStyle(
                        color: (tab3) ? green : black4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        tab1 = false;
                        tab2 = false;
                        tab3 = false;
                        tab4 = true;
                      });
                    },
                    child: Text(
                      grocery,
                      style: TextStyle(
                        color: (tab4) ? green : black4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 328,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (tab1) ...[
                        Row(
                          children: [
                            productContainer(
                              id: 1,
                              context: context,
                              image: products[0].image,
                              name: "Avodaka Salad",
                              price: 20,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[0]);
                              },
                              plusButtonPressed: () {
                                log("plus Tapped");
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[0]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 2,
                              context: context,
                              image: products[1].image,
                              name: "Monsoon Salad",
                              price: 15,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[1]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[1]);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            productContainer(
                              id: 3,
                              context: context,
                              image: products[2].image,
                              name: "Basic Salad",
                              price: 10,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[2]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[2]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 6,
                              context: context,
                              image: products[5].image,
                              name: "Fruits Salad",
                              price: 10,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[5]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[5]);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            productContainer(
                              id: 5,
                              context: context,
                              image: products[4].image,
                              name: "Loyal Salad",
                              price: 28,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[4]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[4]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 4,
                              context: context,
                              image: products[3].image,
                              name: "Royal Salad",
                              price: 25,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[3]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[3]);
                              },
                            ),
                          ],
                        ),
                      ] else if (tab2) ...[
                        Row(
                          children: [
                            productContainer(
                              id: 7,
                              context: context,
                              image: products[6].image,
                              name: "All Fruits",
                              price: 23,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[6]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[6]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 8,
                              context: context,
                              image: products[7].image,
                              name: "Mix Fruits",
                              price: 29,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[7]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[7]);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            productContainer(
                              id: 9,
                              context: context,
                              image: products[8].image,
                              name: "Unique Fruits",
                              price: 40,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[8]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                    listen: false);
                              },
                            ),
                          ],
                        ),
                      ] else if (tab4) ...[
                        Row(
                          children: [
                            productContainer(
                              id: 10,
                              context: context,
                              image: products[9].image,
                              name: "All Grocery",
                              price: 100,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[9]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[9]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 11,
                              context: context,
                              image: products[10].image,
                              name: "Mix Grocery",
                              price: 120,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[10]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[10]);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            productContainer(
                              id: 12,
                              context: context,
                              image: products[11].image,
                              name: "Basic Grocery",
                              price: 150,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[11]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[11]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 13,
                              context: context,
                              image: products[12].image,
                              name: "Crude Grocery",
                              price: 220,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[12]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[12]);
                              },
                            ),
                          ],
                        ),
                      ] else ...[
                        Row(
                          children: [
                            productContainer(
                              id: 14,
                              context: context,
                              image: products[13].image,
                              name: "All Veges",
                              price: 420,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[13]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[13]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 15,
                              context: context,
                              image: products[14].image,
                              name: "Mix Veges",
                              price: 580,
                              onTap: () {
                                Navigator.pushNamed(context, "product_page",
                                    arguments: products[14]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductController>(context,
                                        listen: false)
                                    .addProduct(product: products[14]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
