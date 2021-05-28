import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/theme_data.dart';

class CategoryContainer extends StatefulWidget {
  final MovieModel topwatched;

  const CategoryContainer({Key key, this.topwatched}) : super(key: key);

  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  // String name = '';
  // String image = '';

  @override
  void initState() {
    super.initState();
    // movieApi();
  }

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
                  image: NetworkImage("${widget.topwatched.poster}"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                ("${widget.topwatched.title}"),
                style: boldText1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void movieApi() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var response = await get(
  //     Uri.parse(
  //         "https://api.themoviedb.org/3/movie/157336/images?api_key=c1d96f3eee979c786d5d9ee64920943d"),
  //     headers: {
  //       "x-rapidapi-key": 'c1d96f3eee979c786d5d9ee64920943d',
  //     },
  //   );

  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // loader true
  //     var decoded = jsonDecode(response.body);
  //     print(decoded);
  //     setState(() {
  //       name = '${decoded["id"]}';
  //       image = '${decoded["backdrops"]["file_path"]}';
  //     });
  //   }
  // }
}
