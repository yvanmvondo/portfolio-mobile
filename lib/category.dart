import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List populaire = [];

  @override
  void initState() {
       _readData();
    super.initState();

  }

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/popular.json").then((value) {
      setState(() {
        populaire = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

      double largeur = MediaQuery.of(context).size.width;
      double longueur = MediaQuery.of(context).size.height;

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
      backgroundColor: Colors.grey,
      body: Container(
       color: Color(0xFFebf8fd),
       child: Column(
         children: [
           Expanded(
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   for(int i =0; i<populaire.length; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 250,
                        width: largeur-20,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: i.isEven? Color(0xff629138) : Colors.blue.shade200,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                children: [
                                  Text(
                                    populaire[i]["name"],
                                    textAlign: TextAlign.start,
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
                      ),
                    ),
                 ]
              ),
             )
          )
         ],
       ),
      //  child: Stack(
      //    children: [
      //      Positioned(
      //        top: 30,
      //        left: 10,
      //        child: IconButton(
      //          onPressed: () {
      //             Get.back();
      //          }, 
      //          icon: const Icon(
      //            Icons.arrow_back,
      //            color: Colors.black,
      //           )
      //         ),
      //      ),




      //    ],
      //  ),
      ),
    );
  }
}