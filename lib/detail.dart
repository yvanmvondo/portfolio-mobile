// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/detailController.dart';
import 'package:portfolio/utils/audioFile.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late AudioPlayer advancedPlayer;

    List images = [];

  @override
  void initState() {
    _readData();
    super.initState();
    advancedPlayer = AudioPlayer();

  }

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/popular.json").then((value) {
      setState(() {
        images = json.decode(value);
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {

      double largeur = MediaQuery.of(context).size.width;
      double longueur = MediaQuery.of(context).size.height;
       int _currentIndex = 0;

       final DetailController love = Get.put(DetailController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFebf8fd),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, 
          icon: Icon(
            Icons.home,
            color: Colors.black,
          )
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                width: largeur,
                height: 100,
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff629138),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            "img/avatar.png",
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "....",
                              style: TextStyle(
                                color: Color(0xFFfcfffe),
                                fontSize: 15,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "titre",
                              style: TextStyle(
                                color: Color(0xFFfcfffe),
                                fontSize: 12,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      Expanded(child: Container()),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff629138),
                        ),
                        child: Center(
                          child: Icon(
                            color: Colors.black54,
                            Icons.notifications,
                            size: 30,
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                width: largeur,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff629138),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset(0, 10),
                      color: Colors.grey.withOpacity(0.2)
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Text(
                              "Preparation",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "5 min",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      AudioFile(advancedPlayer: advancedPlayer, ),
                      SizedBox(height: 10),
                      Divider(thickness: 1.0),
                      SizedBox(height: 5),
                      Container(
                        width: largeur,
                        child: Text(
                        Get.arguments['description'],                          
                        style: TextStyle(
                            color: Color(0xFFfcfffe),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(thickness: 1.0),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.watch_later, 
                                color: Color(0xFFfcfffe),
                              ),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                     Get.arguments['time'],     
                                    style: const TextStyle(
                                      color: Color(0xFFfcfffe),
                                      fontSize: 12,
                                    ),
                                  ),
                                    Text(
                                    "2022",
                                    style: const TextStyle(
                                      color: Color(0xFFfcfffe),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                              
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                     Get.arguments['prize'],     
                                    style: const TextStyle(
                                      color: Color(0xFFfcfffe),
                                      fontSize: 12,
                                    ),
                                  ),
                                    Text(
                                    "Fcfa",
                                    style: const TextStyle(
                                      color: Color(0xFFfcfffe),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Container(
                width: largeur,
                height: 20,
                child:
                  RichText(
                    text: TextSpan(
                      text: "Ingrédients",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      
                      children: [
                        TextSpan(
                          text: " : ",
                        ),
                        TextSpan(
                          text: images.length.toString(),
                          style: TextStyle(
                            color: Colors.amber.shade600,
                          )
                        )
                      ]
                    ),
                    
                  ),
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  for(int i = 0; i<images.length; i++)
                  Container(
                    width: 50,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                              images[i]["img"]
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        
        ),

      ),
            bottomNavigationBar: BottomAppBar(
                notchMargin: 0,
                child: Container(
                height: 50,
                width: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white
                    )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                         
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: IconButton(
                            onPressed: () {
                              love.loveCounter();
                              // print("i love foods");
                            }, 
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                          fit: BoxFit.scaleDown,
                        child: Text(
                          "Ajouter aux favoris",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),     
    );
  }
}