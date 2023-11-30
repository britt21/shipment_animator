import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shipment_delivery_app/home.dart';

import '../colors/color.dart';
import '../drawable/svg.dart';

class MoveMateHome extends StatefulWidget {
  const MoveMateHome({Key? key}) : super(key: key);

  @override
  State<MoveMateHome> createState() => _MoveMateHomeState();
}

class _MoveMateHomeState extends State<MoveMateHome> {
  @override
  Widget build(BuildContext context) {
    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        // Disable back button press
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false, // Disable back arrow
          flexibleSpace: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(),
            ),
          ),
          title: Text(
            "MoveMate",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset(movemate), // Replace with your SVG asset
              ),
              Container(
                height: 150,
                width: 150,
                child: SvgPicture.asset(esybox), // Replace with your SVG asset
              ),
              Text(
                "Total Estimate Amount",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$14000",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    " USD",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 30),
                child: Text(
                  "This Amount is estimated this will vary\nif you change your location or weigh",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() =>HomeDashboard());
                        // Add your button onPressed logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange.shade600, // Button color
                        onPrimary: Colors.white, // Text color
                      ),
                      child: Text('Back to home'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Reset the status bar color when the widget is disposed
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: app_purple,
        )
    );
    super.dispose();
  }
}
