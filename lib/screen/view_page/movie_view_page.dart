import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/theme_data.dart';

class MovieViewPage extends StatefulWidget {
  final MovieModel view;

  const MovieViewPage({
    Key key,
    this.view,
  }) : super(key: key);
  @override
  _MovieViewPageState createState() => _MovieViewPageState();
}

class _MovieViewPageState extends State<MovieViewPage> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    movieView(widget.view.id);
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
          : Container(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: primaryTextColor,
                        size: 18,
                      ),
                      label: Text(
                        '${widget.view.title}',
                        style: boldText1,
                      ),
                    ),
                    isLoading
                        ? Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            child: Center(
                              child: Image.asset(
                                "assets/video/loding.gif",
                                height: 50,
                                color: primaryColor,
                              ),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              image: DecorationImage(
                                image: NetworkImage('${widget.view.banner}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            height: 140,
                            width: 95,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: "${widget.view.poster}",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                height: 140,
                                child: Center(
                                  child: Image.asset(
                                    "assets/video/loding.gif",
                                    height: 50,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.view.title}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Catergory: ',
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' ${widget.view.catergory}',
                                          style: TextStyle(
                                            color: secondaryTextColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Release Date:  ',
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '${widget.view.releaseDate}',
                                          style: TextStyle(
                                            color: secondaryTextColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Score: ',
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' ${widget.view.score}',
                                          style: TextStyle(
                                            color: secondaryTextColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    text: TextSpan(
                                      text: 'Description: ',
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '${widget.view.description}',
                                          style: TextStyle(
                                            color: secondaryTextColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void movieView(int movieId) async {
    setState(() => isLoading = true);
    var response = await get(
      Uri.parse(
          '${AppConfig.movieview}/$movieId?api_key=62d1dd5722f913d8e325724485323bdd'),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      print(decoded['id']);
      MovieModel(
        id: decoded['id'],
        title: '${decoded["original_title"]}',
        poster: "${AppConfig.imageUrl}${decoded["poster_path"]}",
        score: "${decoded["vote_average"]}",
        releaseDate: "${decoded["release_date"]}",
        description: "${decoded["overview"]}",
        banner: "${decoded["backdrop_path"]}",
      );
    }
    setState(() => isLoading = false);
  }
}
