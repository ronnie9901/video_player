import 'dart:developer';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/api/api.dart';
import 'package:video_player/contoller/ApiController.dart';
import 'package:video_player/model/mdel.dart';
import 'package:video_player/service/Audio_service.dart';
import 'package:video_player/view/homepage.dart';
String search = '';
bool _isExpanded = false;
bool isPlaying = false;
TextEditingController searchController = TextEditingController();
Future<List<MusicModal>>? searchResult;
var controller = Get.put(ApiController());

class Songs extends StatefulWidget {
  const Songs({super.key});
  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xFF1D1B3F),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace:       CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width , // Dynamically adjust width
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover, // Ensure the image scales properly within the circle
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 300, // Adjusted height for better scaling
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1, // Maintain a square aspect ratio
                viewportFraction: 0.8, // Adjust this to ensure proper spacing
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: _isExpanded ? 250.0 : 0.0,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            search = value;
                          });
                        },
                        controller: searchController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Color(0xFF1D1B3F),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                      ),
                    ),
                    // Search Icon to toggle animation
                    IconButton(
                      icon: Icon(
                        _isExpanded ? Icons.close : Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                          if (!_isExpanded) {
                            searchController
                                .clear(); // Clear text when collapsed
                          }
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: FutureBuilder(
              future: Apihelper.apihelper.fatch(search),
              builder: (context, snapshot) {
                log("${snapshot.data}");

                if (snapshot.hasData) {
                  log("${snapshot.data}");

                  MusicModal musics = MusicModal.fromJson(snapshot.data!);

                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(musics.data.results.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () async {
                              await AudioService.initAudio(
                                musics.data.results[index].downloadUrl[4].url,
                              );

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MusicPlayerScreen(
                                  name: '${musics.data.results[index].name}',
                                  artist: '${musics.data.results[index].artists.primary[0].name}',
                                  img: musics.data.results[index].image[2].url,
                                ),
                              ));
                              await AudioService.player.play();
                            },
                            child: ListTile(
                              leading: (musics.data.results[index].like)
                                  ? const Icon(Icons.graphic_eq, color: Colors.blue)
                                  : const Icon(Icons.music_note, color: Colors.white),
                              title: Text(
                                '${musics.data.results[index].name}',
                                style: TextStyle(color: isPlaying ? Colors.blue : Colors.white),
                              ),
                              subtitle: Text(
                                ' ${musics.data.results[index].album.name}',
                                style: const TextStyle(color: Colors.white60),
                              ),
                              trailing: const Icon(Icons.favorite, color: Colors.blue),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching data'));
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

