
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/dashboard.dart';
//import 'package:portfolio/detail.dart';
import 'package:portfolio/dashboard.dart';
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
        GetPage(name: "/", page: ()=>const Dashboard())
      ],
    );
  }
}
