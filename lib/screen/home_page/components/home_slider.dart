import 'package:flutter/material.dart';
import 'package:movie_app/theme_data.dart';

class HomeSlider extends StatefulWidget {
  final String title;
  final String poster;
  final String score;

  const HomeSlider({
    Key key,
    this.title,
    this.poster,
    this.score,
  }) : super(key: key);
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: primaryColor,
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
          image: NetworkImage('${widget.poster}'),
          // fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.transparent,
            scaffoldBackgroundColor,
          ],
        ),
      ),
      child: Container(
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
                      '${widget.title}',
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
                          '${widget.score}',
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
    );
  }
}
