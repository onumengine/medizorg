import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'to ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'Medizorg',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              Text(
                'Official Public Service Announcement on Coronavirus from the World Health Organization',
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Image.asset('lib/assets/doctor.png'),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_rounded),
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up_page');
                        },
                      ),
                    )
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
