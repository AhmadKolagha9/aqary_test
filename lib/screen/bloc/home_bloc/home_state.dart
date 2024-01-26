import 'package:aqary_tset/model/category_model.dart';
import 'package:aqary_tset/model/product_model.dart';
import 'package:aqary_tset/model/slider_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object?> get props => [];
}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoading extends HomeBlocState {}

class HomeBlocLoaded extends HomeBlocState {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  final List<SliderModel> sliders;

  const HomeBlocLoaded({
    required this.products,
    required this.categories,
    required this.sliders,
  });
}

class HomeBlocError extends HomeBlocState {
  final String error;

  const HomeBlocError(this.error);
}