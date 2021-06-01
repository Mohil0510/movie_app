import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/theme_data.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/widget/common_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/screen/home_page/components/home_slider.dart';
import 'package:movie_app/screen/home_page/components/category_container.dart';

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
  List<MovieModel> topratedlist = [];
  List<MovieModel> nowplayinglist = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    topWatche();
    morelikethis();
    toprated();
    nowplaying();
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
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 8),
                        enableInfiniteScroll: false,
                      ),
                      items: topwatchelist.map((MovieModel movie) {
                        return HomeSlider(
                          sliders: movie,
                        );
                      }).toList(),
                    ),
                    CommonWidget.category(
                      categoryname: 'Now Playings',
                    ),
                    Container(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryContainer(
                                movieData: nowplayinglist[index],
                              ),
                            ],
                          ),
                        ),
                        itemCount: nowplayinglist.length,
                      ),
                    ),
                    CommonWidget.category(categoryname: 'More like this'),
                    Container(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryContainer(
                                movieData: morelikethislist[index],
                              ),
                            ],
                          ),
                        ),
                        itemCount: morelikethislist.length,
                      ),
                    ),
                    CommonWidget.category(categoryname: 'Best all time'),
                    Container(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryContainer(
                                movieData: topratedlist[index],
                              ),
                            ],
                          ),
                        ),
                        itemCount: topratedlist.length,
                      ),
                    ),
                    CommonWidget.category(categoryname: 'Top action'),
                    Container(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryContainer(
                                movieData: topwatchelist[index],
                              ),
                            ],
                          ),
                        ),
                        itemCount: topwatchelist.length,
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
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/upcoming?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=1'),
    );
    if (response.statusCode == 200) {
      // loader true
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (topwatchelist.length < 10) {
            topwatchelist.add(MovieModel(
              id: item['id'],
              title: '${item["original_title"]}',
              poster: "${AppConfig.imageUrl}${item["poster_path"]}",
              banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
              score: "${item["vote_average"]}",
              releaseDate: "${item["release_date"]}",
              description: "${item["overview"]}",
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
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/popular?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=3'),
    );
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (morelikethislist.length < 10) {
            morelikethislist.add(MovieModel(
              id: item['id'],
              title: '${item["original_title"]}',
              poster: "${AppConfig.imageUrl}${item["poster_path"]}",
              banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
              score: "${item["vote_average"]}",
              releaseDate: "${item["release_date"]}",
              description: "${item["overview"]}",
            ));
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }

  void toprated() async {
    setState(() => isLoading = true);
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/top_rated?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=1'),
    );
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (topratedlist.length < 10) {
            topratedlist.add(MovieModel(
              id: item['id'],
              title: '${item["original_title"]}',
              poster: "${AppConfig.imageUrl}${item["poster_path"]}",
              banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
              score: "${item["vote_average"]}",
              releaseDate: "${item["release_date"]}",
              description: "${item["overview"]}",
            ));
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }

  void nowplaying() async {
    setState(() => isLoading = true);
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/now_playing?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=4'),
    );
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (nowplayinglist.length < 10) {
            nowplayinglist.add(MovieModel(
              id: item['id'],
              title: '${item["original_title"]}',
              poster: "${AppConfig.imageUrl}${item["poster_path"]}",
              banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
              score: "${item["vote_average"]}",
              releaseDate: "${item["release_date"]}",
              description: "${item["overview"]}",
            ));
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }
}
