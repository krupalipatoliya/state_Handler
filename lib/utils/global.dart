import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/productcontroller.dart';
import '../models/products.dart';
import 'colours.dart';

List<Product> products = [
  Product(
    id: 1,
    name: "Avodaka Salad",
    price: 20.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNc9bcaXx6kdlA-0ZByLpRz8pCYeRAFuSUfw&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 20.0,
  ),
  Product(
    id: 2,
    name: "Monsoon Salad",
    price: 15.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-d-uvgeRapxtYu7RrIDc9eGRqM7QxzyAodg&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 15.0,
  ),
  Product(
    id: 3,
    name: "Royal Salad",
    price: 25.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUf6zlgH4HnDEpY4RubUXP4EPE7VFpVYyh1Q&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 25.0,
  ),
  Product(
    id: 4,
    name: "Fruits Salad",
    price: 10.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIPvzkN4olXhmv3PBh2ZXEPRv-AQo_kv_0Kw&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 10.0,
  ),
  Product(
    id: 5,
    name: "Loyal Salad",
    price: 28.0,
    image: "assets/images/food5.png",
    quantity: 1,
    isLike: "false",
    price2: 28.0,
  ),
  Product(
    id: 6,
    name: "Basic Salad",
    price: 10.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJnJXcQGcDo_5Y1w2FPlnDZuxUb8r8e6nYqg&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 10.0,
  ),
  Product(
    id: 7,
    name: "All Fruits",
    price: 23.0,
    image: "assets/images/fruit1.png",
    quantity: 1,
    isLike: "false",
    price2: 23.0,
  ),
  Product(
    id: 8,
    name: "Mi Fruits",
    price: 29.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiHmw_nmJ-HYQatJ02btnLcZEmR3LUv419Cg&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 29.0,
  ),
  Product(
    id: 9,
    name: "Unique Fruits",
    price: 40.0,
    image: "assets/images/fruit3.png",
    quantity: 1,
    isLike: "false",
    price2: 40.0,
  ),
  Product(
    id: 10,
    name: "All Grocery",
    price: 100.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhxLABjqmhhydx-yRaieijXbm6kzxc7yQiBg&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 100.0,
  ),
  Product(
    id: 11,
    name: "Mix Grocery",
    price: 120.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPgj_KsXonNuOv63NkPUvFuWfu0VxsSire8A&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 120.0,
  ),
  Product(
    id: 12,
    name: "Basic Grocery",
    price: 150.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9B55LMOQ3Szu6IZfgj6jDuFp92mc_ILqRhA&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 150.0,
  ),
  Product(
    id: 13,
    name: "Crude Grocery",
    price: 220.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZLqt8in_KuD7oOrNw3n249uvjh_oj_VfvUA&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 220.0,
  ),
  Product(
    id: 14,
    name: "All Veges",
    price: 420.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9YtDtvIwb6cWjtkxPuCgh_Nj-UdkuO9FIPg&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 420.0,
  ),
  Product(
    id: 15,
    name: "Mix Veges",
    price: 580.0,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREltEdDVWCbr3lDimh76eC15j4D-t_fhV2kA&usqp=CAU",
    quantity: 1,
    isLike: "false",
    price2: 580.0,
  ),
];

Widget productContainer(
    {required BuildContext context,
    required String image,
    required int id,
    required String name,
    required double price,
    required Function()? onTap,
    required Function()? plusButtonPressed}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: height * 0.35,
          width: width * 0.44,
          decoration: BoxDecoration(
              color: black7,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  offset: const Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (height * 0.26) / 1.5,
                width: width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          Provider.of<ProductController>(context, listen: false)
                              .likeProduct(product: products[id]);
                          log(products[id].isLike, name: "Is Like");
                          log(id.toString(), name: "Index");
                        },
                        icon: (products[id].isLike == "true")
                            ? const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                size: 25,
                                color: Color(0XFFBAC2CD),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0XFF1E2126),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "20min",
                    style: TextStyle(
                      color: Color(0XFFBAC2CD),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Color(0XFFffc107),
                      ),
                      Text(
                        "2.5",
                        style: TextStyle(
                          color: Color(0XFFBAC2CD),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      color: Color(0XFF1E2126),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        bottom: -60,
        right: -60,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: green,
          ),
          child: Align(
            alignment: const Alignment(-1.1, -1.1),
            child: IconButton(
              onPressed: plusButtonPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
