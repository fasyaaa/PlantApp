import 'package:flutter/material.dart';
import 'package:plant_app/screens/home/components/header_with_searchbox.dart';
import 'package:plant_app/screens/home/components/recommend_plants.dart';
import 'package:plant_app/screens/home/components/title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // give total height and width of our screen
    Size size = MediaQuery.of(context).size;
    // enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBbtn(title: "Recomended", press: () {}),
          RecommendPlants(),
          TitleWithMoreBbtn(title: "Featured Plants", press: (){}),
        ],
      ),
    );
  }
}
