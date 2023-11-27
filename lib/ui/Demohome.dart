import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:shipment_delivery_app/home.dart';

import '../colors/color.dart';
import '../drawable/pngs.dart';
import '../drawable/svg.dart';

class DummyHome extends StatefulWidget {
  const DummyHome({super.key});

  @override
  State<DummyHome> createState() => _DummyHomeState();
}

class _DummyHomeState extends State<DummyHome> {

  double paddvalue = 0.0;

  FocusNode searchFocusNode = FocusNode();

  bool selected = false;

  @override
  void initState() {
    searchFocusNode.addListener(() {
      setState(() {
        paddvalue = paddvalue == 0.0 ? 50.0: 0.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(

          children: [

            Center(child: ElevatedButton(
              onPressed: (){
                Get.to(() => HomeDashboard());
                setState(() {
                  paddvalue = paddvalue == 0.0 ? 50.0: 0.0;
                });
              }, child: Text(
             "Click me",),
            ) ),

            AnimatedPositioned(
              height: selected ? 900 : 110,
              width: selected ? 900 : 110,
              top: selected ? 900 : 110,
              curve: Curves.fastOutSlowIn,


              duration: Duration(seconds: 1),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    selected = !selected;

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(

                    height: 100.0,width: MediaQuery.of(context).size.width,
                  color: app_purple,),
                ),
              ),
            ),

             GestureDetector(
               onTap: (){
                 setState(() {
                   print("CLICKEDOBBSERVENODER ${searchFocusNode.hasFocus}");

                 });
               },
               child: TextField(
                 onChanged: (value){
                   print("editCLICKEDOBBSERVENODER ${searchFocusNode.hasFocus}");

                 },
                focusNode: searchFocusNode,
                decoration: InputDecoration(
                  hintText: 'Enter the receipt number...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
            ),
             ),

          ],
        ),
      ),
    );

  }
}
