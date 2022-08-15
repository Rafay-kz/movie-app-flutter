import 'dart:convert';

class MovieModel{
String imdbId='';
 String poster='';
   String title='';
   String releaseDate='';
   int id=0;
   String overview='';
   int totalVote=0;
   bool adult=false;
   double rating=0 ;


   MovieModel.empty();
  MovieModel({required this.imdbId, required this.poster, required this.title, required this.releaseDate,required this.id, required this.overview, required this.totalVote, required this.adult,required this.rating});

factory MovieModel.fromJson(Map<String, dynamic> json) {
   return MovieModel(
        imdbId: json["imdb_id"] ?? '',
        poster: json["poster_path"] ?? '',
        title: json["original_title"] ?? '',
        releaseDate: json["release_date"] ?? '',
   id: json["id"]??0,
       overview: json['overview']??'',
     totalVote: json['vote_count']??0,
     adult: json['adult']?? false,
       rating: json['vote_average']??0


   );
  }
}