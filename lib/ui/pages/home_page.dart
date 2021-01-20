import 'package:flutter/material.dart';
import 'package:medizorg/blocs/molecules/health_article_bloc.dart';
import 'package:medizorg/ui/screens/home_screen.dart';
import 'package:medizorg/ui/screens/notifications_screen.dart';
import 'package:medizorg/ui/screens/profile_screen.dart';
import 'package:medizorg/utils/strings.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _listOfScreens = <Widget>[
    HomeScreen(),
    NotifScreen(),
    ProfileScreen(),
  ];

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HealthArticleBloc>.value(
          value: HealthArticleBloc(),
        )
      ],
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: _listOfScreens[_currentIndex],
          ),
        ),
        bottomSheet: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded),
              label: TEXT_MESSAGE,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: TEXT_CALENDAR,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page_rounded),
              label: TEXT_PROFILE,
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
