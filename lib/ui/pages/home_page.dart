import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/search_bar.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Medizorg'),
                    IconButton(
                      icon: Icon(Icons.notifications_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
                SearchBar(),
                SizedBox(height: 16.0),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'What do you need?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: <Widget>[],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_rounded),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
