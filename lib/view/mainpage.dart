import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/view/homepage.dart';

class MusicPlayerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1B3F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Music Player'),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Music Player Card
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      // Replace with actual image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Kendrick Lamar\nPlaying Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                // Automatically scroll the images
                enlargeCenterPage: true,
                // Enlarge the current image in view
                aspectRatio: 1,
                // Aspect ratio to match the CircleAvatar
                viewportFraction: 0.7, // Size of the displayed items
              ),
            ),

            SizedBox(height: 20),

            // Albums Section
            Text(
              'Albums',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // buildAlbumCard('A Boogie wit da Hoodie',
                  //     'https://link-to-a-boogie-image.com'), // Replace
                  // buildAlbumCard('Scorpion',
                  //     'https://link-to-scorpion-image.com'), // Replace
                  // Add more album cards here
                ],
              ),
            ),
            SizedBox(height: 20),

            // Playlists Section
            Text(
              'Playlists',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildPlaylistCard('Hip-Hop', Colors.red),
                buildPlaylistCard('Pop Music', Colors.blue),
                buildPlaylistCard('Blues', Colors.green),
              ],
            ),
          ],
        ),
      ),
      

    );
  }

  // Helper methods for building album and playlist cards
  Widget buildAlbumCard(String albumName, String imageUrl) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            albumName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildPlaylistCard(String playlistName, Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          playlistName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
