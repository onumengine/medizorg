import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/health_article.dart';
import 'package:medizorg/ui/molecules/search_bar.dart';
import 'package:medizorg/ui/molecules/service_item.dart';
import 'package:medizorg/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(TEXT_MEDIZORG),
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
                      TEXT_WHAT_DO_YOU_NEED,
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
                          text: TEXT_CONSULT,
                        ),
                        ServiceItem(
                          iconData: Icons.message_rounded,
                          text: TEXT_CHAT,
                        ),
                        ServiceItem(
                          iconData: Icons.video_call_rounded,
                          text: TEXT_VIRTUAL_CONSULT,
                        ),
                        ServiceItem(
                          iconData: Icons.book_online_rounded,
                          text: TEXT_SCHEDULE,
                        ),
                        ServiceItem(
                          iconData: Icons.receipt_rounded,
                          text: TEXT_MY_PURCHASES,
                        ),
                        ServiceItem(
                          iconData: Icons.notes_rounded,
                          text: TEXT_MY_RECORDS,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        TEXT_HEALTH_ARTICLES,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        TEXT_SEE_ALL,
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
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 8.0),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  )
                ],
              ),
            );
  }
}
