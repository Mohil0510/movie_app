import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/view_page/movie_view_page.dart';
import 'package:movie_app/theme_data.dart';

class HomeSlider extends StatefulWidget {
  final MovieModel sliders;

  const HomeSlider({Key key, this.sliders}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieViewPage(view: widget.sliders),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              imageUrl: "${widget.sliders.banner}",
              fit: BoxFit.fill,
              placeholder: (context, url) => Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: double.infinity,
                child: Center(
                  child: Image.asset(
                    "assets/video/loding.gif",
                    height: 50,
                    color: primaryColor,
                  ),
                ),
              ),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: Offset(4, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: primaryColor,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  scaffoldBackgroundColor,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
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
                      SizedBox(
                        width: 160,
                        height: 20,
                        child: Text(
                          '${widget.sliders.title}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(
                            image: AssetImage('assets/images/imdb.png'),
                            height: 13,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              '${widget.sliders.score}',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            'Score',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
