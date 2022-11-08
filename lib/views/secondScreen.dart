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
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('likePage');
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
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
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('cartPage');
                    },
                    icon: const Icon(Icons.shopping_cart, color: black7),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                height: 523,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (tab1) ...[
                        SizedBox(
                          height: 800,
                          child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, i) {
                                return Card(
                                  child: ListTile(
                                    isThreeLine: true,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "product_page",
                                          arguments: products[i]);
                                    },
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Provider.of<ProductController>(
                                                      context,
                                                      listen: false)
                                                  .addProduct(
                                                      product: products[i]);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: green,
                                            )),
                                        IconButton(
                                          onPressed: () {
                                            Provider.of<ProductController>(
                                                    context,
                                                    listen: false)
                                                .likeProduct(
                                                    product: products[i]);
                                          },
                                          icon: (products[i].isLike == "true")
                                              ? const Icon(Icons.favorite,
                                                  color: Colors.red)
                                              : const Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    title: Text(products[i].name),
                                    subtitle:
                                        Text(products[i].price.toString()),
                                    leading: Image.network(
                                      products[i].image,
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ] else if (tab2) ...[
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  isThreeLine: true,
                                  onTap: () {
                                    Navigator.pushNamed(context, "product_page",
                                        arguments: products[i]);
                                  },
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Provider.of<ProductController>(
                                                    context,
                                                    listen: false)
                                                .addProduct(
                                                    product: products[i]);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: green,
                                          )),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<ProductController>(
                                                  context,
                                                  listen: false)
                                              .likeProduct(
                                                  product: products[i]);
                                        },
                                        icon: (products[i].isLike == "true")
                                            ? const Icon(Icons.favorite,
                                                color: Colors.red)
                                            : const Icon(Icons.favorite_border,
                                                color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  title: Text(products[i].name),
                                  subtitle: Text(products[i].price.toString()),
                                  leading: Image.network(
                                    products[i].image,
                                    height: 70,
                                    width: 70,
                                  ),
                                );
                              }),
                        ),
                      ] else if (tab4) ...[
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  isThreeLine: true,
                                  onTap: () {
                                    Navigator.pushNamed(context, "product_page",
                                        arguments: products[i]);
                                  },
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Provider.of<ProductController>(
                                                    context,
                                                    listen: false)
                                                .addProduct(
                                                    product: products[i]);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: green,
                                          )),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<ProductController>(
                                                  context,
                                                  listen: false)
                                              .likeProduct(
                                                  product: products[i]);
                                        },
                                        icon: (products[i].isLike == "true")
                                            ? const Icon(Icons.favorite,
                                                color: Colors.red)
                                            : const Icon(Icons.favorite_border,
                                                color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  title: Text(products[i].name),
                                  subtitle: Text(products[i].price.toString()),
                                  leading: Image.network(
                                    products[i].image,
                                    height: 70,
                                    width: 70,
                                  ),
                                );
                              }),
                        ),
                      ] else ...[
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  isThreeLine: true,
                                  onTap: () {
                                    Navigator.pushNamed(context, "product_page",
                                        arguments: products[i]);
                                  },
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Provider.of<ProductController>(
                                                    context,
                                                    listen: false)
                                                .addProduct(
                                                    product: products[i]);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: green,
                                          )),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<ProductController>(
                                                  context,
                                                  listen: false)
                                              .likeProduct(
                                                  product: products[i]);
                                        },
                                        icon: (products[i].isLike == "true")
                                            ? const Icon(Icons.favorite,
                                                color: Colors.red)
                                            : const Icon(Icons.favorite_border,
                                                color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  title: Text(products[i].name),
                                  subtitle: Text(products[i].price.toString()),
                                  leading: Image.network(
                                    products[i].image,
                                    height: 70,
                                    width: 70,
                                  ),
                                );
                              }),
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
