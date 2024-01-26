import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/widgets/home_widgets/categories_list.dart';
import '../core/widgets/home_widgets/coursal_slider.dart';
import '../core/widgets/home_widgets/product_list.dart';
import '../utlis/injection.dart';
import 'bloc/home_bloc/home_bloc.dart';
import 'bloc/home_bloc/home_event.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = sl<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(FetchAllData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async{
            homeBloc.add(FetchAllData());
          },
          child: SingleChildScrollView(
            child: BlocBuilder<HomeBloc, HomeBlocState>(
              bloc: homeBloc,
              builder: (context, state) {
                if (state is HomeBlocLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (state is HomeBlocLoaded) {
                  return Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomCarousalSlider(sliderItems: state.sliders),
                    const SizedBox(height: 30),
                    CategoryList(categories: state.categories),
                    const SizedBox(height: 30),
                    ProductList(products: state.products,)
                  ],
                );
                }else if (state is HomeBlocError) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
