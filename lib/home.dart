// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

      double largeur = MediaQuery.of(context).size.width;
      double longueur = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff4F792A),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            width: largeur,
            child: Container(
              height: 700,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/ready.png", 
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Faites votre choix",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Culinaire",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: largeur-40,
                    child: FittedBox(
                       fit: BoxFit.scaleDown,
                      child: Text(
                        "La pratique de cuisine avec une communauté africaine",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFfbc33e),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        primary: Color(0xFFfbc33e),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () { 
                        Get.to(()=> Dashboard());
                      },
                      child: FittedBox(
                         fit: BoxFit.scaleDown,
                        child: Text(
                          "Allons-y",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}