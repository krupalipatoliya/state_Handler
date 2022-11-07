import '../../views/home_screen/page/home_screen.dart';
import 'package:flutter/cupertino.dart';

import '../views/cart_page.dart';
import '../views/productPage.dart';
import '../views/secondScreen.dart';
import 'appRoutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().homePage: (context) => const ProductHomePage(),
  AppRoutes().introScreen: (context) => const HomePage(),
  AppRoutes().productPage: (context) => const ProductPage(),
  AppRoutes().cartPage: (context) => const CartPage(),
};
