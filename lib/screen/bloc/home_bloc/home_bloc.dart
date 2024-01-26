import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_layer.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final DataLayer dataLayer;

  HomeBloc(this.dataLayer) : super(HomeBlocInitial()) {
    on<FetchAllData>(getFetchAllData);
  }

  void getFetchAllData(HomeBlocEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeBlocLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      final products = await dataLayer.fetchProducts();
      print(products);
      final categories = await dataLayer.fetchCategories();
      print(categories);
      final sliders = await dataLayer.fetchSliders();
      print(sliders);
      emit(HomeBlocLoaded(
          products: products, categories: categories, sliders: sliders));
    } catch (e) {
      print(e);
      emit(HomeBlocError(e.toString()));
    }
  }
}
