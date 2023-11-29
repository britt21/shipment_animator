import 'dart:ffi';

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

class _HistoryHomeState extends State<HistoryHome> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      // Your custom logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: litterwhite,
        appBar: AppBar(
          backgroundColor: app_purple,
          leading: Icon(Icons.arrow_back_ios, color: Colors.white),
          title: Text(
            "Shipment History",
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                          Text("Shipments", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ),
                    // Use a Column with children instead of ListView.builder
                    for (int index = 0; index < 5; index++)
                      AnimatedShipmentHistoryContainer(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}



// Positioned(
// bottom: 0,
// left: 0,
// right: 0,
// child: Container(
// height: _fadeHeight,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.bottomCenter,
// end: Alignment.topCenter,
// colors: [litterwhitefade, litterwhitefadelitter],
// ),
// ),
// ),
// ),
