import 'package:flutter/material.dart';
import 'package:medizorg/blocs/organisms/health_article_bloc.dart';
import 'package:provider/provider.dart';

class HealthArticle extends StatefulWidget {
  _HealthArticleState createState() => _HealthArticleState();
}

class _HealthArticleState extends State<HealthArticle> {
  Widget build(BuildContext context) {
    final HealthArticleBloc healthArticleBloc =
        Provider.of<HealthArticleBloc>(context);

    return GestureDetector(
      onTap: () {
        print('Pressed Article');
      },
      child: Container(
        height: 150.0,
        width: 350.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    healthArticleBloc.date,
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: 250.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          healthArticleBloc.title,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          healthArticleBloc.body,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('Pressed bookmark');
                    },
                    child: Icon(
                      Icons.bookmark_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print('Pressed arrow');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
