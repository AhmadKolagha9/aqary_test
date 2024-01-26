import 'package:aqary_tset/core/widgets/general_widgets/sub_app_bar.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = "/product-details";

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductModel product;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: SubAppBar(title: product.name),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset(product.imgUrl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  product.dsc,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Price: ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: '\$${product.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
