import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../service/Audio_service.dart';

class MusicPlayerScreen extends StatefulWidget {

  final String name;
  final String artist;
  final  String img ;



  const MusicPlayerScreen({super.key,  required this.name, required this.artist, required this.img  });



  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {

  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    AudioService.player.positionStream.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });

    AudioService.player.durationStream.listen((duration) {
      setState(() {
        totalDuration = duration ?? Duration.zero;
      });
    });
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await AudioService.player.pause();
    } else {
      await AudioService.player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void seekMusic(double value) {
    final position = Duration(seconds: value.toInt());
    AudioService.player.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1B3F), // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white54),
        ),
        actions: [
          Icon(Icons.more_vert, color: Colors.white54),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),

                CircleAvatar(
                  radius: 130,
                  backgroundImage: NetworkImage(widget.img),
                ),


            SizedBox(height: 50),
            // Song Title and Artist
            Text(
            "  ${widget.name}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${widget.artist}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white60,
              ),
            ),
            SizedBox(height: 20),
            // Music Progress Bar
            Slider(
              value: currentPosition.inSeconds.toDouble(),
              min: 0,
              max: totalDuration.inSeconds.toDouble(),
              activeColor: Colors.blue,
              inactiveColor: Colors.white54,
              onChanged: seekMusic,  // Allow the user to seek
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(currentPosition), style: TextStyle(color: Colors.white60)),
                Text(_formatDuration(totalDuration), style: TextStyle(color: Colors.white60)),
              ],
            ),
            SizedBox(height: 30),
            // Player Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.skip_previous, color: Colors.white, size: 40),
                InkWell(
                  onTap: togglePlayPause,
                  child: Icon(
                    isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    color: Colors.blue,
                    size: 60,
                  ),
                ),
                Icon(Icons.skip_next, color: Colors.white, size: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to format Duration as a readable string
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}

final List<String> images = [
  'assets/8961947.jpg',
  'assets/3fb1a00d0357a87cddb0edb2b89a8f91.jpg',
  'assets/55f1a0c560ccab25d94b7db6d63553c2.jpg',
  'assets/698dfa2736b36c492cbab1d0af25863b.jpg',
  'assets/925edd53bea9be4395d70f041e084ae0.jpg',
  'assets/d7d7ac0127f105432a86c0035c7d9711.jpg',
  'assets/f9399bcbde4f2876a19b66a11f32182f.jpg' // Add your images here
];
