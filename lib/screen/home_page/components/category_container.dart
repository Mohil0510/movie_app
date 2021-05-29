import 'package:flutter/material.dart';
import 'package:movie_app/theme_data.dart';

class CategoryContainer extends StatefulWidget {
  final String title;
  final String poster;

  const CategoryContainer({
    Key key,
    this.title,
    this.poster,
  }) : super(key: key);
  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        width: 120,
        child: Column(
          children: [
            Container(
              height: 160,
              width: 120,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                image: DecorationImage(
                  image: NetworkImage("${widget.poster}"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                ("${widget.title}"),
                overflow: TextOverflow.ellipsis,
                style: boldText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
