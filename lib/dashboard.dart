
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List nouveau = [];
  List populaire = [];

    _readData() async {
  //  await DefaultAssetBundle.of(context).loadString("json/recent.json").then((value) {
  //     setState(() {
  //       nouveau = json.decode(value);
  //     });
  //   });

    await DefaultAssetBundle.of(context).loadString("json/popular.json").then((value) {
      setState(() {
        populaire = json.decode(value);
      });
    });
  }

  @override
  void initState() {
       _readData();
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
      double largeur = MediaQuery.of(context).size.width;
      double longueur = MediaQuery.of(context).size.height;
      int _currentIndex = 0;

    return Scaffold(
     body: Container(
       padding: const EdgeInsets.only(top: 70),
       color: Color(0xFFebf8fd),
       child: Column(
         children: [
           Container(
             width: largeur,
             height: 100,
             margin: const EdgeInsets.only(left: 25, right: 25),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: const Color(0xff629138),
             ),
             child: Container(
               padding: const EdgeInsets.only(left: 20, right: 20),
               child: Row(
                 children: [
                   const CircleAvatar(
                     radius: 40,
                     backgroundImage: const AssetImage(
                       "img/avatar.png",
                     ),
                   ),
                   const SizedBox(width: 10),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text(
                         "Bienvenue",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                       ),
                       const SizedBox(height: 5),
                       Text(
                         "...",
                          style: TextStyle(
                            color: Colors.orange.shade100,
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
                       color: Color(0xFFebf8fd),
                     ),
                     child: Center(
                       child: Icon(
                         color: Colors.black54,
                         Icons.notifications,
                         size: 30,
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                Text(
                  "Recèttes Populaires",
                   style: TextStyle(
                    color: Color(0xFF1f2326),
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Toutes",
                   style: TextStyle(
                    color: Color(0xFF1f2326),
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                  ),
                  child: GestureDetector(),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(  
            height: 200,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.95),
              itemCount: populaire.length,
              itemBuilder: (_, i) {
                return Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 200,
                  width: largeur-20,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff629138),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Text(
                              populaire[i]["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(child: Container(),)
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: largeur,
                        child: Text(
                            populaire[i]["description"],
                            style: TextStyle(
                              color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(thickness: 1),
                      Row(
                        children: [
                          for(int i = 0; i<populaire.length; i++)
                          Container(
                            width: 40,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: AssetImage(
                                     populaire[i]["img"]
                                  ),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                Text(
                  "Recèttes récentes",
                   style: TextStyle(
                    color: Color(0xFF1f2326),
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Toutes",
                   style: TextStyle(
                    color: Color(0xFF1f2326),
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                  ),
                  child: GestureDetector(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context, 
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  return Container(
                    width: largeur,
                    height: 90,
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff629138),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                               "img/avatar.png"
                            ),
                          ),
                          SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Titre",
                                style: TextStyle(
                                 color: Colors.white,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  "title",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            //width: 90,
                            // height: 90,
                            child: Text(
                              "00: 00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ),
          )
         ],
       ),
     ),
    );
  }
}