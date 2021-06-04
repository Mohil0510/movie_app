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
  List<MovieModel> upcominglist = [];
  List<MovieModel> recommendationslist = [];
  List<MovieModel> trendinglist = [];
  List<MovieModel> topratedlist = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    upcoming();
    recommendations();
    trending();
    toprated();
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
                      items: upcominglist.map((MovieModel movie) {
                        return HomeSlider(
                          sliders: movie,
                        );
                      }).toList(),
                    ),
                    CommonWidget.category(
                      categoryname: 'Recommendations movie',
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
                                movieData: recommendationslist[index],
                              ),
                            ],
                          ),
                        ),
                        itemCount: recommendationslist.length,
                      ),
                    ),
                    CommonWidget.category(categoryname: 'Trending movie'),
                    Container(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryContainer(
                                movieData: trendinglist[index],
                              ),
                            ],
                          ),
                        ),
                        itemCount: trendinglist.length,
                      ),
                    ),
                    CommonWidget.category(categoryname: 'Top Rated Movie'),
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
                  ],
                ),
              ),
            ),
    );
  }

  void upcoming() async {
    setState(() => isLoading = true);
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/upcoming?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=1'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (upcominglist.length < 10) {
            if (MovieModel != null) {
              upcominglist.add(MovieModel(
                id: item['id'],
                title: '${item["original_title"]}',
                poster: "${AppConfig.imageUrl}${item["poster_path"]}",
                banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
                score: "${item["vote_average"]}",
                releaseDate: "${item["release_date"]}",
                description: "${item["overview"]}",
              ));
            }
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }

  void recommendations() async {
    setState(() => isLoading = true);
    var response = await get(
      Uri.parse(
          '${AppConfig.baseUrl}/337404/recommendations?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=1'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (recommendationslist.length < 10) {
            if (MovieModel != null) {
              recommendationslist.add(MovieModel(
                id: item['id'],
                title: '${item["original_title"]}',
                poster: "${AppConfig.imageUrl}${item["poster_path"]}",
                banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
                score: "${item["vote_average"]}",
                releaseDate: "${item["release_date"]}",
                description: "${item["overview"]}",
              ));
            }
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }

  void trending() async {
    setState(() => isLoading = true);
    var response = await get(
      Uri.parse(
          '${AppConfig.trendingmovie}/trending/movie/day?api_key=62d1dd5722f913d8e325724485323bdd'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (trendinglist.length < 10) {
            if (MovieModel != null) {
              trendinglist.add(MovieModel(
                id: item['id'],
                title: '${item["original_title"]}',
                poster: "${AppConfig.imageUrl}${item["poster_path"]}",
                banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
                score: "${item["vote_average"]}",
                releaseDate: "${item["release_date"]}",
                description: "${item["overview"]}",
              ));
            }
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
          '${AppConfig.baseUrl}/top_rated?api_key=62d1dd5722f913d8e325724485323bdd&language=en-US&page=2'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          if (topratedlist.length < 10) {
            if (MovieModel != null) {
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
          }
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }
}
