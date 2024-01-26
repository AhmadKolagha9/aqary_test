import 'package:aqary_tset/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/widgets/general_widgets/sub_app_bar.dart';
import '../core/widgets/home_widgets/product_list.dart';
import '../utlis/injection.dart';
import 'bloc/home_bloc/home_bloc.dart';
import 'bloc/home_bloc/home_event.dart';

class CategoryDetailsScreen extends StatefulWidget {

  static const routeName = "/category-products";
  const CategoryDetailsScreen({super.key});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {

  late CategoryModel category;
  final homeBloc = sl<HomeBloc>();
  @override
  void initState() {
    super.initState();

    homeBloc.add(FetchAllData());
  }

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: SubAppBar(title: category.name),
      body: RefreshIndicator(
        onRefresh: () async{
          homeBloc.add(FetchAllData());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: BlocBuilder<HomeBloc, HomeBlocState>(bloc: homeBloc,
            builder: (context, state) {
              if (state is HomeBlocLoading) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (state is HomeBlocLoaded) {
                return ProductList(products: state.products,);
              }else if (state is HomeBlocError) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('No data available'));
              }
            },),
        ),
      ),
    );
  }
}
