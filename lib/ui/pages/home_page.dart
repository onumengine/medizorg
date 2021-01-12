import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/health_article.dart';
import 'package:medizorg/ui/molecules/search_bar.dart';
import 'package:medizorg/ui/molecules/service_item.dart';

class HomePage extends StatefulWidget {
  final String label = 'Medizorg';
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
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.label),
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
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: GridView.count(
                    physics: ScrollPhysics(),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    crossAxisCount: 3,
                    children: <Widget>[
                      ServiceItem(
                        iconData: Icons.mail_outline_rounded,
                        text: 'Consult',
                      ),
                      ServiceItem(
                          iconData: Icons.message_rounded, text: 'Chat'),
                      ServiceItem(
                        iconData: Icons.video_call_rounded,
                        text: 'Virtual consult',
                      ),
                      ServiceItem(
                        iconData: Icons.book_online_rounded,
                        text: 'Schedule',
                      ),
                      ServiceItem(
                        iconData: Icons.receipt_rounded,
                        text: 'My purchases',
                      ),
                      ServiceItem(
                          iconData: Icons.notes_rounded, text: 'My records'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Health Articles',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Container(
                  height: 200.0,
                  child: ListView.separated(
                    itemCount: 5,
                    addAutomaticKeepAlives: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => HealthArticle(),
                    separatorBuilder: (context, index) => SizedBox(width: 8.0),
                  ),
                ),
                SizedBox(
                  height: 70.0,
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomNavigationBar(
        selectedItemColor: Colors.blueGrey,
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
      resizeToAvoidBottomInset: true,
    );
  }
}
