import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/home_page/components/category_container.dart';
import 'package:movie_app/screen/home_page/components/home_slider.dart';

import 'package:movie_app/theme_data.dart';
import 'package:movie_app/widget/common_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final MovieModel topwatched;

  const HomePage({
    Key key,
    this.topwatched,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> topwatchelist = [];
  List<MovieModel> morelikethislist = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    topWatche();
    morelikethis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: isLoading
          ? Container(
              height: double.infinity,
              child: Center(
                child: Image.asset(
                  "assets/video/loding.gif",
                  height: 50,
                  color: primaryColor,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: ListView.builder(
                        itemBuilder: (context, index) => HomeSlider(
                          poster: "${topwatchelist[index].banner}",
                          score: topwatchelist[index].rating,
                          title: "${topwatchelist[index].title}",
                        ),
                        itemCount: topwatchelist.length,
                      ),
                    ),
                    CommonWidget.category(categoryname: 'Top watched'),
                    isLoading
                        ? Container(
                            height: 185,
                            child: Center(
                              child: Image.asset(
                                "assets/video/loding.gif",
                                height: 50,
                                color: primaryColor,
                              ),
                            ),
                          )
                        : Container(
                            height: 190,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    CategoryContainer(
                                      poster: "${topwatchelist[index].poster}",
                                      title: "${topwatchelist[index].title}",
                                    ),
                                  ],
                                ),
                              ),
                              itemCount: topwatchelist.length,
                            ),
                          ),
                    CommonWidget.category(categoryname: 'More like this'),
                    isLoading
                        ? Container(
                            height: 185,
                            child: Center(
                              child: Image.asset(
                                "assets/video/loding.gif",
                                height: 50,
                                color: primaryColor,
                              ),
                            ),
                          )
                        : Container(
                            height: 190,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    CategoryContainer(
                                      poster:
                                          "${morelikethislist[index].poster}",
                                      title: "${morelikethislist[index].title}",
                                    ),
                                  ],
                                ),
                              ),
                              itemCount: morelikethislist.length,
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }

  void topWatche() async {
    setState(() => isLoading = true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/upcoming?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=1'),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      // loader true
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          // print(item["original_title"]);
          // print("${AppConfig.imageUrl}${item["poster_path"]}");
          if (topwatchelist.length < 10) {
            topwatchelist.add(MovieModel(
              id: item['id'],
              title: '${item["original_title"]}',
              poster: "${AppConfig.imageUrl}${item["poster_path"]}",
              banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
              rating: "${item["vote_average"]}",
            ));
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }

  void morelikethis() async {
    setState(() => isLoading = true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/popular?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=2'),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      // loader true
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          print(item["original_title"]);
          print("${AppConfig.imageUrl}${item["poster_path"]}");
          if (morelikethislist.length < 10) {
            morelikethislist.add(MovieModel(
              id: item['id'],
              title: '${item["original_title"]}',
              poster: "${AppConfig.imageUrl}${item["poster_path"]}",
              banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
              rating: "${item["vote_average"]}",
            ));
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }
}
