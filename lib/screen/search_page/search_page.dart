import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/home_page/components/category_container.dart';
import 'package:movie_app/theme_data.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _query = "";
  List<MovieModel> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      decoration: greyContainerDecoration,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          style: text2,
                          onChanged: (value) => _query = value,
                          onEditingComplete: () => callApi(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Searche movie....',
                            hintStyle: text2,
                            icon: Icon(
                              Icons.search,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 550,
                    width: double.infinity,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: searchList.length,
                      itemBuilder: (context, index) => CategoryContainer(
                        movieData: searchList[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void callApi() async {
    var response = await get(
      Uri.parse('${AppConfig.searchUrl}&query=$_query&include_adult=false'),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // loader true
      var decoded = jsonDecode(response.body);
      if (decoded["results"] is List) {
        decoded["results"].forEach((item) {
          // print(item["original_title"]);
          // print("${AppConfig.imageUrl}${item["poster_path"]}");
          if (searchList.length < 10) {
            setState(() {
              searchList.add(MovieModel(
                id: item['id'],
                title: '${item["original_title"]}',
                poster: "${AppConfig.imageUrl}${item["poster_path"]}",
                banner: "${AppConfig.imageUrl}${item["backdrop_path"]}",
                score: "${item["vote_average"]}",
              ));
            });
          }
        });
      }
    }
  }
}
