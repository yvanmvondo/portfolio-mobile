
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/category.dart';
import 'package:portfolio/dashboard.dart';
//import 'package:portfolio/detail.dart';
import 'package:portfolio/dashboard.dart';
import 'package:portfolio/detail.dart';
import 'package:portfolio/home.dart';
//import 'package:portfolio/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>const HomePage()),
        GetPage(name: "/dash", page: ()=>const Dashboard()),
        GetPage(name: "/detail", page: ()=>const DetailPage()),
        GetPage(name: "/category", page: ()=>const CategoryPage(), transition: Transition.zoom   )
      ],
    );
  }
}
