import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors/color.dart';
import '../drawable/pngs.dart';
import '../drawable/svg.dart';

class ItemsSent extends StatelessWidget {
  const ItemsSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(height: 35, width: 35, child: SvgPicture.asset(sentbox)),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sender",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Atlanta, 124",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Time"),
                Row(
                  children: [
                    Container(height: 7, width: 15, child: Image.asset(gdot)),
                    Text("2day - 3days"),
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ItemsRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(height: 35, width: 35, child: SvgPicture.asset(recbox)),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Receiver",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Atlanta, 124",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Status"),
                Row(
                  children: [
                    Text("Waiting to collect"),
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Searchlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 30, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 30, width: 30, child: SvgPicture.asset(dbox)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Macbook Air",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("#N383839398383 . Paris -> Morrocco"),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.1,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}


class ShipmentHistoryContainer extends StatelessWidget {
  final paddvalue;
   ShipmentHistoryContainer({required this.paddvalue });

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(top: paddvalue),
      duration: Duration(milliseconds: 700),

      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 20, width: 15, child: SvgPicture.asset(recycle)),
                      Text(
                        " in-progress",
                        style: TextStyle(color: green),
                      ),
                    ],
                  ),
                  height: 25,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: litterwhite),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 35, bottom: 15, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Arriving Today!",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Delivery, #N1289282821\nfrom atlanta, is ariving today",
                          style: TextStyle(fontSize: 12),
                        ),
                        Row(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                child: SvgPicture.asset(esybox))
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$1000 USD - ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: app_purple_deep,
                              fontSize: 12),
                        ),
                        Text(
                          "Sep 23,2023",
                          style: TextStyle(color: app_purple_deep, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





class ChipGroupOne extends StatefulWidget {
  @override
  _ChipGroupOneState createState() => _ChipGroupOneState();
}

class _ChipGroupOneState extends State<ChipGroupOne> {
  List<String> chipTitles = ['Document', 'Glass', 'Liquid', 'Food'];
  List<bool> isSelected = List.generate(4, (index) => false);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(chipTitles.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FilterChip(
              label: Text(
                chipTitles[index],
                style: TextStyle(color: isSelected[index] ? Colors.white : Colors.black, fontWeight: FontWeight.w300),
              ),
              selected: isSelected[index],
              onSelected: (bool selected) {
                setState(() {
                  isSelected[index] = selected;
                });
              },
              backgroundColor: isSelected[index] ? deepblu : Colors.white,
              selectedColor: deepblu,
              checkmarkColor: Colors.white,
              showCheckmark: isSelected[index],
            ),
          );
        }),
      ),
    );
  }
}

class ChipGroupTwo extends StatefulWidget {
  @override
  _ChipGroupTwoState createState() => _ChipGroupTwoState();
}

class _ChipGroupTwoState extends State<ChipGroupTwo> {
  List<String> chipTitles = ['Electronic', 'Product', 'Others'];
  List<bool> isSelected = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(chipTitles.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FilterChip(
              label: Text(
                chipTitles[index],
                style: TextStyle(color: isSelected[index] ? Colors.white : Colors.black, fontWeight: FontWeight.w300),
              ),
              selected: isSelected[index],
              onSelected: (bool selected) {
                setState(() {
                  isSelected[index] = selected;
                });
              },
              backgroundColor: isSelected[index] ? deepblu : Colors.white,
              selectedColor: deepblu,
              checkmarkColor: Colors.white,
              showCheckmark: isSelected[index],
            ),
          );
        }),
      ),
    );
  }
}

