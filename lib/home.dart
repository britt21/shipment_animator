import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colors/color.dart';
import 'drawable/pngs.dart';
import 'drawable/svg.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  double paddvalue = 0.0;

  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    searchFocusNode.addListener(() {
      setState(() {
        print("FOCUS NODE : ${searchFocusNode.hasFocus}");

        paddvalue = paddvalue == 0.0 ? 10.0 : 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            color: app_purple,
            duration: Duration(milliseconds: 500),
            height: !searchFocusNode.hasFocus ? 170 : 150,
            child: Column(
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: !searchFocusNode.hasFocus ? 1.0 : 0.0,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 58.0, right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Profile picture, location
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(manimg),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.send,
                                        color: Colors.white, size: 10),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Your location',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Wertheimer, Illinois',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down_outlined,
                                        color: Colors.white, size: 19),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Notification icon
                        Container(
                          height: 35,
                          width: 35,
                          child: SvgPicture.asset(dbell),
                        ),
                      ],

                    ),
                  ),
                ),
                AnimatedPadding(
                  padding: searchFocusNode.hasFocus
                      ? EdgeInsets.only(left: paddvalue , bottom: paddvalue,right: paddvalue)
                      : EdgeInsets.only(left: 20,right: 20, top: 15),
                  duration: Duration(milliseconds: 500),
                  child: Row(
                    children: [
                      searchFocusNode.hasFocus
                          ? AnimatedOpacity(
                              duration: Duration(milliseconds: 600),
                              opacity: searchFocusNode.hasFocus ? 1.0 : 0.0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    paddvalue == paddvalue ? 15.0 : 0.0;
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                              ),
                            )
                          : SizedBox.shrink(),
                      // White search bar
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: app_purple),
                                SizedBox(width: 8),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: TextField(
                                      focusNode: searchFocusNode,
                                      decoration: InputDecoration(
                                        hintText: 'Enter the receipt number...',
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],

                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
