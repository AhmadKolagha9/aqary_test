import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String imgUrl;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [id, name, imgUrl];
}
