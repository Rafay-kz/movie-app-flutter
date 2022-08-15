import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_app/controller/movie_description_screen_controller.dart';

class MovieDescriptionScreen extends GetView<MovieDescriptionScreenController> {
  const MovieDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.black, child: movieDescription()),
    );
  }

  Widget movieDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: controller.movie.poster != ''
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loding_icon.png',
                  image: 'https://image.tmdb.org/t/p/w500' +
                      controller.movie.poster,
                  fit: BoxFit.fill,
                  height: 350,
                )
              : const Text('No Image...'),
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        controller.movie.title != ''
                            ? TextSpan(
                                text: controller.movie.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand',
                                ))
                            : const TextSpan(
                                text: 'No Title...',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Quicksand')),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Rating:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          controller.movie.rating != 0
                              ? Text(
                            controller.movie.rating.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Quicksand'),
                          )
                              : Text(controller.movie.rating.toString()),
                          const Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Total Vote:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          controller.movie.totalVote != 0
                              ? Text(
                            controller.movie.totalVote.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Quicksand'),
                          )
                              : Text(controller.movie.totalVote.toString()),
                          const Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.blueGrey,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Movie Type:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          controller.movie.adult
                              ? const Text(
                            'Adult',
                            style:  TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.normal),
                          )
                              : const Text('None',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Quicksand')),

                        ],
                      ),


                    ],
                  ),
                  SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      text: 'Release Date:',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                      children: <TextSpan>[
                        controller.movie.releaseDate != ''
                            ? TextSpan(
                                text: controller.movie.releaseDate,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.normal))
                            : const TextSpan(
                                text: 'No Date...',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Quicksand')),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      text: 'Summary:',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                      children: <TextSpan>[
                        controller.movie.overview != ''
                            ? TextSpan(
                                text: controller.movie.overview,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.normal))
                            : const TextSpan(
                                text: 'No Summary',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Quicksand')),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
