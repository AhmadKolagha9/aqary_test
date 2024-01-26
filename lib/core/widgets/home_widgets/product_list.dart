import 'package:aqary_tset/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../screen/product_details_screen.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.asset(product.imgUrl),
          title: Text(product.name),
          subtitle: Text(product.dsc),
          trailing: Text('\$${product.price}'),
          onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product),
        );
      },
    );
  }
}