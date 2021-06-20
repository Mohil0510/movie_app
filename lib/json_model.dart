// import 'dart:convert';

// MovieModel movieModelFromJson(String str) =>
//     MovieModel.fromJson(json.decode(str));

// String movieModelToJson(MovieModel data) => json.encode(data.toJson());

// class MovieModel {
//   final bool adult;
//   final String backdropPath;
//   final int budget;
//   final List<Genre> genres;
//   final String homepage;
//   final int id;
//   final String imdbId;
//   final String originalLanguage;
//   final String originalTitle;
//   final String overview;
//   final double popularity;
//   final String posterPath;
//   final DateTime releaseDate;
//   final int revenue;
//   final int runtime;
//   final String status;
//   final String tagline;
//   final String title;
//   final bool video;
//   final double voteAverage;
//   final int voteCount;

//   MovieModel({
//     this.adult,
//     this.backdropPath,
//     this.budget,
//     this.genres,
//     this.homepage,
//     this.id,
//     this.imdbId,
//     this.originalLanguage,
//     this.originalTitle,
//     this.overview,
//     this.popularity,
//     this.posterPath,
//     this.releaseDate,
//     this.revenue,
//     this.runtime,
//     this.status,
//     this.tagline,
//     this.title,
//     this.video,
//     this.voteAverage,
//     this.voteCount,
//   });

//   factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
//         adult: json["adult"],
//         backdropPath: json["backdrop_path"],
//         budget: json["budget"],
//         genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
//         homepage: json["homepage"],
//         id: json["id"],
//         imdbId: json["imdb_id"],
//         originalLanguage: json["original_language"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         popularity: json["popularity"].toDouble(),
//         posterPath: json["poster_path"],
//         releaseDate: DateTime.parse(json["release_date"]),
//         revenue: json["revenue"],
//         runtime: json["runtime"],
//         status: json["status"],
//         tagline: json["tagline"],
//         title: json["title"],
//         video: json["video"],
//         voteAverage: json["vote_average"].toDouble(),
//         voteCount: json["vote_count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "adult": adult,
//         "backdrop_path": backdropPath,
//         "budget": budget,
//         "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
//         "homepage": homepage,
//         "id": id,
//         "imdb_id": imdbId,
//         "original_language": originalLanguage,
//         "original_title": originalTitle,
//         "overview": overview,
//         "popularity": popularity,
//         "poster_path": posterPath,
//         "release_date":
//             "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//         "revenue": revenue,
//         "runtime": runtime,
//         "status": status,
//         "tagline": tagline,
//         "title": title,
//         "video": video,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//       };
// }

// class Genre {
//   Genre({
//     this.id,
//     this.name,
//   });

//   final int id;
//   final String name;

//   factory Genre.fromJson(Map<String, dynamic> json) => Genre(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }
