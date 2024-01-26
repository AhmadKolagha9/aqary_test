import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String imgUrl;
  final String name;
  final String dsc;
  final double price;

  const ProductModel({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.dsc,
    required this.price,
  });

  @override
  List<Object?> get props => [id, imgUrl, name, dsc, price];
}
