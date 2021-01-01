import 'package:flutter/material.dart';

class HealthArticle extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 400.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text('01 Jan 2021'),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.bookmark_rounded),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COVID-19 Vaccine',
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Text(
                      'Official Public Service Announcement on Coronavirus from the WHO',
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_rounded),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
