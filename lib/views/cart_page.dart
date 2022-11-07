import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/utils/colours.dart';

import '../controllers/productcontroller.dart';
import '../models/products.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> addedProducts =
        Provider.of<ProductController>(context).addedProduct;
    return Scaffold(
        appBar: AppBar(
          title: const Text("All carts"),
          backgroundColor: green,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 590,
                child: ListView.builder(
                    itemCount: addedProducts.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          tileColor: lightGreen.withOpacity(0.3),
                          leading: Image.network(
                            addedProducts[i].image,
                            height: 50,
                            width: 50,
                          ),
                          title: Text(addedProducts[i].name),
                          subtitle: Text("Price: ${addedProducts[i].price2}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<ProductController>(context,
                                            listen: false)
                                        .addProduct(product: addedProducts[i]);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text("   ${addedProducts[i].quantity}   "),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<ProductController>(context,
                                            listen: false)
                                        .removeProduct(
                                            product: addedProducts[i]);
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const Divider(),
            Container(
              margin: EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: lightGreen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Products: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "${Provider.of<ProductController>(context).totalProducts}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Price: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "\$${Provider.of<ProductController>(context).totalPrice}",
                          style: const TextStyle(
                              color: green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
