import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shipment_delivery_app/colors/color.dart';
import 'package:shipment_delivery_app/drawable/svg.dart';
import 'package:shipment_delivery_app/ui/widget.dart';

class HistoryHome extends StatefulWidget {
  const HistoryHome({super.key});

  @override
  State<HistoryHome> createState() => _HistoryHomeState();
}

class _HistoryHomeState extends State<HistoryHome>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  var opacitylevel = 0.0;
  double paddvalue = 0.0;
  double paddingstart = 50.0;



  @override
  void initState() {

    super.initState();
      Future.delayed((Duration.zero),(){
        setState(() {
          paddingstart  = 0.0;
          paddvalue = 0.0;

        });

    });

    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_onTabChanged);

  }

  void _onTabChanged() {

    setState(() {
      paddvalue = paddvalue == 0.0 ? 50.0: 0.0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,

        child: Scaffold(
          backgroundColor: litterwhite,
          appBar: AppBar(
            bottom: TabBar(indicatorColor: Colors.orange,
                controller: _tabController,
                labelColor: Colors.white,unselectedLabelColor: lit_purple,
                labelStyle: TextStyle(fontWeight: FontWeight.w400),
            isScrollable: true, // Enable scrolling for tabs
            tabs: [
              Tab(child: Row(
                children: [Text("All"), SizedBox(width: 7,),Container(height: 25,width: 25,
                  child: CircleAvatar(
                      backgroundColor: _tabController.index == 0 ? Colors.orange : app_purplelit,
                      // Set background color to orange when selected
                      child: Text("7",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13),)
                  ),
                )])),
              Tab(child: Row(
                children: [
                  Text("Completed"), SizedBox(width: 7,),Container(height: 25,width: 25,
                    child: CircleAvatar(
                        backgroundColor: _tabController.index == 1 ? Colors.orange : app_purplelit,
                        // Set background color to orange when selected
                        child: Text("5",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13)
                    ),
                  )
              ),])),
              Tab(child: Row(
                children: [
                  Text("In progress"),SizedBox(width: 7,),Container(height: 25,width: 25,
                    child: CircleAvatar(
                        backgroundColor: _tabController.index == 2 ? Colors.orange : app_purplelit,
                        // Set background color to orange when selected
                        child: Text("3",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13),)
                    ),
                  )
                ],
              ),),
              Tab(child: Row(
                children: [
                  Text("Pending Order"),SizedBox(width: 7,),Container(height: 25,width: 25,
                    child: CircleAvatar(
                        backgroundColor: _tabController.index == 3 ? Colors.orange : app_purplelit,
                        // Set background color to orange when selected
                        child: Text("4",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13),)
                    ),
                  )
                ],
              ),),
              Tab(child: Row(
                children: [
                  Text("Cancelled")
                ],
              ),),

          ]),
          backgroundColor: app_purple,
          leading: GestureDetector(onTap: (){Navigator.pop(context);},
              child: Icon(Icons.arrow_back_ios, color: Colors.white)),
          title: Text(
            "Shipment History",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: AnimatedPadding(
          duration: Duration(milliseconds: 800),
          padding: EdgeInsets.only(top: paddingstart),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Shipments", style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                              ],
                            ),
                          ),
                          // Use a Column with children instead of ListView.builder

                          _tabController.index == 0
                              ? setTabs(_tabController.index)
                              :setTabs2(_tabController.index)




                        ],

                      ),
                    ),
                  ],
                ),
              ),
              // White fade effect above the list but not with the list
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [litterwhitefade, litterwhitefadelitter],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }

  Widget setTabs(int index){
    if(index == 0){
      return AnimatedOpacity(
        opacity: 1.0  ,
        duration: Duration(milliseconds: 500), // Adjust the duration to make it slower

        child: AnimatedPadding(
          padding: EdgeInsets.only(top: paddvalue),
          duration: Duration(milliseconds: 200),

          child: Column(
            children: [
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 300), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 400), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 500), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 600), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),

            ],
          ),
        ),
      );
    }else{

     return AnimatedOpacity(
        opacity: 0,
        duration: Duration(milliseconds: 500), // Adjust the duration to make it slower

        child: AnimatedPadding(
          padding: EdgeInsets.only(top: paddvalue),
          duration: Duration(milliseconds: 200),

          child: Column(
            children: [
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 200), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 300), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 400), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 500), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),

            ],
          ),
        ),
      );

    }
  }
  Widget setTabs2(int index){
    if(index > 0){
      return AnimatedOpacity(
        opacity: 1  ,
        duration: Duration(milliseconds: 500), // Adjust the duration to make it slower

        child: AnimatedPadding(
          padding: EdgeInsets.only(top: paddvalue),
          duration: Duration(milliseconds: 200),

          child: Column(
            
            children: [
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 300), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 400), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),

            ],
          ),
        ),
      );
    }else{

     return AnimatedOpacity(
        opacity: 0,
        duration: Duration(milliseconds: 500), // Adjust the duration to make it slower

        child: AnimatedPadding(
          padding: EdgeInsets.only(top: paddvalue),
          duration: Duration(milliseconds: 200),


          child: Column(
            children: [
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 300), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),
              AnimatedPadding(padding: EdgeInsets.only(top: paddingstart), duration: Duration(milliseconds: 400), child: ShipmentHistoryContainer(paddvalue: paddvalue,)),

            ],
          ),
        ),
      );

    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
