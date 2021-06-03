import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/view_page/movie_view_page.dart';
import 'package:movie_app/theme_data.dart';

class CategoryContainer extends StatefulWidget {
  final MovieModel movieData;

  const CategoryContainer({Key key, this.movieData}) : super(key: key);

  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieViewPage(view: widget.movieData),
          ),
        );
      },
      child: Padding(
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: Offset(4, 4),
                    ),
                  ],
                  // image: DecorationImage(
                  //   image: CachedNetworkImageProvider(
                  //       "${widget.movieData.poster}"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: CachedNetworkImage(
                  imageUrl: "${widget.movieData.poster}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: double.infinity,
                    child: Center(
                      child: Image.asset(
                        "assets/video/loding.gif",
                        height: 50,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  // imageBuilder: (context, imageProvider) => Container(
                  //   height: 160,
                  //   width: 120,
                  //   decoration: BoxDecoration(
                  //     color: secondaryColor,
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(8),
                  //     ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black87,
                  //         blurRadius: 8,
                  //         spreadRadius: 3,
                  //         offset: Offset(4, 4),
                  //       ),
                  //     ],
                  //     image: DecorationImage(
                  //       image: imageProvider,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Text(
                  ("${widget.movieData.title}"),
                  overflow: TextOverflow.ellipsis,
                  style: boldText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
