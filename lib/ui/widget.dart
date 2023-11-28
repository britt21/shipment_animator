import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
