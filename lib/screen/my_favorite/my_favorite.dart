import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/home_page/components/category_container.dart';
import 'package:movie_app/theme_data.dart';

class MyFavorite extends StatefulWidget {
  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  List<MovieModel> myfavoritelist = [];
  bool favorite = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    myfavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryContainer(
                        movieData: myfavoritelist[index],
                      ),
                    ],
                  ),
                ),
                itemCount: myfavoritelist.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void myfavorite() async {
    setState(() => isLoading = true);
    var response = await get(
      Uri.parse('${AppConfig.myfavorite}&page=1'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() => isLoading = true);
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          myfavoritelist.add(MovieModel(
            id: item['id'],
            title: '${item["title"]}',
            poster: "${AppConfig.imageUrl}${item["poster_path"]}",
            banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
            score: "${item["vote_average"]}",
            releaseDate: "${item["release_date"]}",
            description: "${item["overview"]}",
          ));
        });
      }
      setState(() => isLoading = false);
    }
    setState(() => isLoading = false);
  }
}
