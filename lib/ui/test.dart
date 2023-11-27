import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const app_purple = Colors.purple; // Assuming you have defined app_purple somewhere
const manimg = "assets/man.png"; // Replace with your actual image path
const dbell = "assets/bell.svg"; // Replace with your actual SVG path

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_purple,
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: isSearchVisible
              ? Container(
            key: ValueKey('search'),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.only(left: 18),
            child: Row(
              children: [
                Icon(Icons.search, color: app_purple),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter the receipt number...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          )
              : Row(
            key: ValueKey('profile'),
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(manimg),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.send, color: Colors.white, size: 12),
                      Text(
                        'Your location',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'California CA',
                        style: TextStyle(
                          fontSize: 16,
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
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(dbell),
            onPressed: () {
              setState(() {
                isSearchVisible = !isSearchVisible;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [

          // List of names or other content
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: isSearchVisible
                ? SizedBox.shrink()
                : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Tracking"),
                    ],
                  ),
                  // Replace this with your list of names or other content
                  // Example:
                  ListTile(title: Text('Name 1')),
                  ListTile(title: Text('Name 2')),
                  ListTile(title: Text('Name 3')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
