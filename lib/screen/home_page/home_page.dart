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
      body: SingleChildScrollView(
        child: Container(
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
                        color: secondaryColor,
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
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [scaffoldBackgroundColor,],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: primaryTextColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 27,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Releases',
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Movie Name',
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
                }).toList(),
              ),
              CommonWidget.category(categoryname: 'Top watched'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: list.map(
                    (MovieModel topwatchedlist) {
                      return CategoryContainer(
                        topwatched: topwatchedlist,
                      );
                    },
                  ).toList(),
                ),
              ),
              CommonWidget.category(categoryname: 'More like this'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: list.map(
                    (MovieModel topwatchedlist) {
                      return CategoryContainer(
                        topwatched: topwatchedlist,
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
