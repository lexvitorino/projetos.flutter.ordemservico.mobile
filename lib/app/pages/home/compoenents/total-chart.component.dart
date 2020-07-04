import 'package:flutter/material.dart';
import 'package:osmobile/app/theme/colors.dart';

class TotalChart extends StatelessWidget {
  String value;
  String description;
  IconData topicIcon;
  String title;
  IconData typeIconCard;
  Color backgroundColor;

  TotalChart({
    this.value,
    this.description,
    this.topicIcon,
    this.title,
    this.typeIconCard,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
        ),
        Card(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          value,
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            color: neutralColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      topicIcon,
                      size: 40,
                      color: backgroundColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                color: backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            color: lightColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      typeIconCard,
                      color: lightColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
