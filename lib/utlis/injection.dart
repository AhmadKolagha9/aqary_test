import 'package:get_it/get_it.dart';

import '../data/data_layer.dart';
import '../screen/bloc/home_bloc/home_bloc.dart';


final GetIt sl = GetIt.instance;

void iniGetIt() {

  sl.registerLazySingleton<DataLayer>(() => DataLayer());
  sl.registerFactory(() => HomeBloc(sl()));
  // locator.registerFactory(() => ProductsBloc());
}