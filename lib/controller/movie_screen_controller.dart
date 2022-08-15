
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/movie_service.dart';


class MovieScreenController extends GetxController with SingleGetTickerProviderMixin{
  final String apiKey='39cf98d7db1ad3069227393fa6315d10';
  RxList<MovieModel> movies=<MovieModel>[].obs;
  Rx<MovieModel> particularMovie=MovieModel.empty().obs;

@override
  void onInit() {
    fetchAllMovies();
    super.onInit();


  }

  void fetchAllMovies() async{
    movies.value=await MovieService().getMovies();
  }
  onMovieTap(int i) async {
  particularMovie.value=movies[i];
  Get.toNamed('/DescriptionScreen', arguments: particularMovie.value);

  }



}