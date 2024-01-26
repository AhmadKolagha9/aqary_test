import 'package:aqary_tset/screen/home_screen.dart';
import 'package:aqary_tset/utlis/injection.dart';
import 'package:flutter/material.dart';

import 'core/routes.dart';

void main() {

  iniGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: Routes.getRoutes(context),
      home: HomeScreen(),
    );
  }
}

