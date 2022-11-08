import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/productcontroller.dart';
import '../models/products.dart';
import '../utils/colours.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    List<Product> likedProducts =
        Provider.of<ProductController>(context).likedProduct;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Like Products"),
        centerTitle: true,
        backgroundColor: green,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 590,
              child:(likedProducts.isNotEmpty)? ListView.builder(
                  itemCount: likedProducts.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        tileColor: lightGreen.withOpacity(0.3),
                        leading: Image.network(
                          likedProducts[i].image,
                          height: 50,
                          width: 50,
                        ),
                        title: Text(likedProducts[i].name),
                        subtitle: Text("Price: ${likedProducts[i].price2}"),
                        trailing: Row(),
                      ),
                    );
                  }):Center(child: Text("Not Found Data"),),
            ),
          ),
        ],
      ),
    );
  }
}
