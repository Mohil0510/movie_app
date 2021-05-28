import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/list_data.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/home_page/components/category_container.dart';

import 'package:movie_app/theme_data.dart';
import 'package:movie_app/widget/common_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<MovieModel> list = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      list = homeSliders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/logos/Logo2.png'),
          height: 27,
          color: primaryColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              minRadius: 18,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: false,
                autoPlayInterval: Duration(seconds: 5),
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) =>
                    setState(() => currentIndex = index),
              ),
              items: list.map((MovieModel homeSliders) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.shade900,
                      //     blurRadius: 10,
                      //     spreadRadius: 2,
                      //     offset: Offset(5, 5),
                      //   ),
                      // ],
                      image: DecorationImage(
                        image: AssetImage('${homeSliders.poster}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
            CommonWidget.category(categoryname: 'Top watched'),
            Row(
              children: [
                CategoryContainer(),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
