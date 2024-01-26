import 'package:equatable/equatable.dart';

class SliderModel extends Equatable {
  final int id;
  final String imgUrl;

  const SliderModel({
    required this.id,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [id, imgUrl];
}