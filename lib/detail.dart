// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/dashboard.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

      double largeur = MediaQuery.of(context).size.width;
      double longueur = MediaQuery.of(context).size.height;
       int _currentIndex = 0;

    return Scaffold(
      body: Container(
       color: Color(0xFFebf8fd),
       child: Stack(
         children: [
           Positioned(
             top: 50,
             left: 10,
             child: IconButton(
               onPressed: () {}, 
               icon: Icon(
                 Icons.arrow_back,
                 color: Colors.black,
                )
              ),
           ),
           Positioned(
             top: 120,
             left: 0,
             height: 100,
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
                         children: [
                           Text(
                             "data",
                              style: const TextStyle(
                                color: Color(0xFFfcfffe),
                                fontSize: 15,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                             "data",
                              style: const TextStyle(
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
             )
            ),
            Positioned(
              top: 320,
              left: 0,
              width: largeur,
              height: longueur,
              child: Container(
                width: 80,
                height: 200,
                color: Color(0xFFfcfffe),
              )
            ),
            Positioned(
              top: 250,
              left: 0,
              width: largeur,
              height: 250,
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                width: largeur,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff629138),
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
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Text(
                              "data",
                              style: const TextStyle(
                                color: Color(0xFFfcfffe),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: largeur,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  .",
                          style: TextStyle(
                            color: Color(0xFFfcfffe),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                    "000",
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
                                    "000",
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
                      )
                    ],
                  ),
                ),
              )
            ),
            Positioned(
              top: 520,
              left: 25,
              height: 50,
              child: Container(
                width: largeur,
                child:
                  RichText(
                    text: TextSpan(
                      text: "Total",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      
                      children: [
                        TextSpan(
                          text: " ",
                        ),
                        TextSpan(
                          text: "(00)",
                          style: TextStyle(
                            color: Colors.amber.shade600,
                          )
                        )
                      ]
                    ),
                    
                  ),
                
              )
            ),
            Stack(
              children: [
                for(int i = 0; i< 5; i++)
                Positioned(
                  top: 550,
                  left: (25 + i * 55).toDouble(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(
                          "img/02.png",
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                )
              ],
            ),
            Positioned(
              top: 670,
              left: 25,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Ajouter aux Favoris",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            )
         ],
       ),
      ),
    );
  }    
}