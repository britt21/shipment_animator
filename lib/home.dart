import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shipment_delivery_app/ui/widget.dart';
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
  bool isBoatMoved = false;
  int selectedTabIndex = 0;

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
      backgroundColor: litwhite,

      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              color: app_purple,
              duration: Duration(milliseconds: 500),
              height: !searchFocusNode.hasFocus ? 170 : 110,
              child: Column(
                children: [
                  AnimatedContainer(
                    height: !searchFocusNode.hasFocus ? 100 : 50,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedOpacity(
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
                                    Expanded(
                                      child: Row(
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
                                    ),
                                    Expanded(
                                      child: Row(
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
                  ),
                  AnimatedPadding(
                    padding: !searchFocusNode.hasFocus
                        ? EdgeInsets.only(
                        left: 20, bottom: paddvalue, right: 20, top: 10)
                        : EdgeInsets.only(
                        left: 15,
                        right: 20,
                        top: !searchFocusNode.hasFocus ? 15 : 0),
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        searchFocusNode.hasFocus
                            ? AnimatedOpacity(
                          duration: Duration(milliseconds: 1500),
                          opacity: !searchFocusNode.hasFocus ? 0.0 : 1.0,
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
                              borderRadius: BorderRadius.circular(25),
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
                                          hintText: !searchFocusNode.hasFocus
                                              ? 'Enter the receipt number...'
                                              : "",
                                          border: InputBorder.none,
                                          hintStyle:
                                          TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 50,
                                    child: SvgPicture.asset(sideicon),
                                  )
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
            SizedBox(height: 10,),
           !searchFocusNode.hasFocus ?  Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: Row(
                  children: [
                    Text("Tracking", style: TextStyle(color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),),
                  ],
                ),

              ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),

                    child: Column(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipment Number",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                    height: 35,
                                    width: 50,
                                    child: Image.asset(tractor)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "NJEOENIN222S33383",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 0.1,
                              color: Colors.grey.shade200,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ItemsSent(),
                            SizedBox(
                              height: 25,
                            ),
                            ItemsRec(),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 0.1,
                              color: Colors.grey.shade200,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "+ Add Stop",
                                style: TextStyle(color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: Row(
                  children: [
                    Text("Available Vehicles", style: TextStyle(color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),),
                  ],
                ),

              ),

              Container(height: 200,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Ocean flight"),
                            Row(
                              children: [
                                Text("Internstional",style: TextStyle(fontSize: 11),),
                              ],
                            ),
                            Container(
                                height: 100,
                                width: 150,
                                child: SvgPicture.asset(boat))
                          ],
                        ),
                      ),
                    );
                  }, itemCount: 9,scrollDirection: Axis.horizontal,

                  )



              )
            ],):
            Text("HELLO")
            


          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: selectedTabIndex,
            onTap: onTabSelected,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Calculate',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Shipment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: app_purple_deep,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: 0,
            left: (MediaQuery.of(context).size.width / 4) * selectedTabIndex,
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 2,
              color: app_purple_deep,
            ),
          ),
        ],
      ),
        );
  }
  void onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
