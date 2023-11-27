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


            Container(height: 170,color: Colors.black,
              child: Column(children: [
                Container(
                  height: 90,color: Colors.blue,
                child:                  Container(
                  height: 20,color: Colors.red,)
                  ,),




              ],),
            )
          ],
        ),
      ),
    );

  }
}
