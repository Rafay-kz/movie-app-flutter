

import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService{


  static final MovieService _instance = MovieService._internal();
  MovieService._internal(){

  }

  factory MovieService() => _instance;

  Future<List<MovieModel>> getMovies()async{

    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/all/day?api_key=39cf98d7db1ad3069227393fa6315d10"));
    if(response.statusCode==200){
      print('Response Length: ${response.body.length}');
      Map movieData=jsonDecode(response.body);
      Iterable list=movieData["results"];
      print(movieData);
      // MovieModel movieModel= MovieModel.fromJson(jsonDecode(response.body));
      return list.map((e) =>MovieModel.fromJson(e)).toList();

    }else
    {throw Exception('failed to load Movies!');}
  }
 Future<MovieModel> getParticularMovie(int i)async{
    String movieId=i.toString();

    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId?api_key=39cf98d7db1ad3069227393fa6315d10"));
    if(response.statusCode==200){
      MovieModel movieModel= MovieModel.fromJson(jsonDecode(response.body));
      return movieModel;
    }else
    {throw Exception('failed to load Movies!');}
  }

}