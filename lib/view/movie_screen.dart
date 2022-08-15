import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/movie_screen_controller.dart';


class MovieScreen extends GetView<MovieScreenController>{
  const MovieScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text('Trending Movies', style: TextStyle(color: Colors.white),),
        centerTitle: true,


      ),
      body:
      Container(
        width: Get.width,

        decoration: const BoxDecoration(
          image:  DecorationImage(image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover,),
        ),
        child:
            Obx(()=>InkWell(child: listofMovie(),
            /*onTap: controller.onMovieTap,*/))

        ,
      ),
    );
  }
  Widget listofMovie(){

    return ListView.builder(itemCount: controller.movies.length,
      itemBuilder: (BuildContext context,int index){
        if (controller.movies.isNotEmpty) {
          return ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:
                             controller.movies[index].poster!=''?
                             FadeInImage.assetNetwork(
                               placeholder: 'assets/images/loading.jpg',
                               image:  'https://image.tmdb.org/t/p/w500'+
                                   controller.movies[index].poster,
                             ):
                              const Text('No Image...')
                          ),

                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                controller.movies[index].title!=''?
                                Text('Title: ${controller.movies[index].title}', style: const TextStyle(color: Colors.white),):const Text('No Title',style: TextStyle(color: Colors.white)),
                                controller.movies[index].releaseDate!=''?
                                Text('Release Date: ${controller.movies[index].releaseDate}', style: const TextStyle(color: Colors.white),):const Text('No Date',style: TextStyle(color: Colors.white)),
                               SizedBox(height: 10,),
                                InkWell(child: const Text('View Detail...', style: TextStyle(color: Colors.red,
                                fontWeight: FontWeight.bold),),
                                onTap: (){
                                  controller.onMovieTap(index);
                                },)


                              ],
                            ),
                          ),
                        ),


                      ],

                    ),
                  ),
                ),
              )


          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
