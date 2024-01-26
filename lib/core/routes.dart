import 'package:flutter/material.dart';

import '../screen/category_details_screen.dart';
import '../screen/home_screen.dart';
import '../screen/product_details_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      ProductDetailsScreen.routeName: (BuildContext context) =>
          const ProductDetailsScreen(),
      CategoryDetailsScreen.routeName: (BuildContext context) =>
          const CategoryDetailsScreen(),
      HomeScreen.routeName: (BuildContext context) =>
          const HomeScreen(),
    };
  }
}
