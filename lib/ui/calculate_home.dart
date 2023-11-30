import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shipment_delivery_app/drawable/svg.dart';
import 'package:shipment_delivery_app/ui/widget.dart';

import '../colors/color.dart';
import 'move_mate_home.dart';

class CalculateHome extends StatefulWidget {
  const CalculateHome({super.key});

  @override
  State<CalculateHome> createState() => _CalculateHomeState();
}

class _CalculateHomeState extends State<CalculateHome> {

  double paddvalue = 30.0;
  double animheight = 50;

  @override
  void initState() {
    super.initState();
    // Delay the animation to start after the build is complete
    Future.delayed(Duration.zero, () {
      setState(() {
        paddvalue = 0.0;
        animheight = 0.0;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: litterwhite,

          appBar: AppBar(
            backgroundColor: app_purple,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white)),
            title: Text(
              "Calculate",
              style: TextStyle(
                  color: Colors.white, fontSize: 16),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AnimatedContainer(duration: Duration(milliseconds: 300),color: app_purple,height: animheight,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Destination",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          // Use a Column with children instead of ListView.builder

                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                            child: Container(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 17,
                                      width: 17,
                                      child: SvgPicture.asset(upload),
                                    ),
                                    Container(
                                      height: 20,
                                      // Adjust the height as needed
                                      width: 1,
                                      // Adjust the width to control the line thickness
                                      color: Colors.grey.shade400,
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: " Sender Location",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                )


                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 17,
                                      width: 17,
                                      child: SvgPicture.asset(download),
                                    ),
                                    Container(
                                      height: 20,
                                      // Adjust the height as needed
                                      width: 1,
                                      // Adjust the width to control the line thickness
                                      color: Colors.grey.shade400,
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: " Receiver Location",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                )


                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 17,
                                      width: 17,
                                      child: SvgPicture.asset(scale),
                                    ),
                                    Container(
                                      height: 20,
                                      // Adjust the height as needed
                                      width: 1,
                                      // Adjust the width to control the line thickness
                                      color: Colors.grey.shade400,
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: " Approx Weight",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                )


                            ),
                          ),

                          Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Text("Packaging",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Row(
                                    children: [
                                      Text("What are you sending?",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: Container(
                                      height: 50,
                                      padding:
                                      EdgeInsets.symmetric(
                                          vertical: 1.0, horizontal: 16.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            child: SvgPicture.asset(esybox),
                                          ),
                                          Container(
                                            height: 20,
                                            // Adjust the height as needed
                                            width: 1,
                                            // Adjust the width to control the line thickness
                                            color: Colors.grey.shade400,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                          ),
                                          Expanded(
                                            child: Text("Box",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down,
                                            color: Colors.grey,)
                                        ],
                                      )


                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Text("Categories",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Row(
                                    children: [
                                      Text("What are you sending?",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),

                                Column(
                                  children: [
                                    AnimatedPadding(
                                        padding: EdgeInsets.only(left: paddvalue),
                                    duration: Duration(milliseconds: 400),
                                    child: ChipGroupOne()),
                                    AnimatedPadding(
                                        padding: EdgeInsets.only(left: paddvalue),
                                        duration: Duration(milliseconds: 400),

                                        child: ChipGroupTwo())

                                  ],
                                ),
                              ]
                          ),

                        ],
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 30,),
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() =>MoveMateHome());
                          // Add your button onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange.shade600, // Button color
                          onPrimary: Colors.white, // Text color
                        ),
                        child: Text('Calculate'),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ));
  }



}
