import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import '../styles/musicplayer_style.dart';
import 'dart:ui';

class ActivityPage extends StatefulWidget {
  final String title;

  const ActivityPage({super.key, required this.title});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<ActivityPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentIndex = 0;
  bool _isPlaying = false;
  bool _isFirstPlay = true; 

  List<String> songs = const [
    "music/Hozier-Francesca.mp3",
    "music/FlorenceTheMachine-Dog DaysAreOver.mp3",
    "music/Hozier-First Time.mp3",
    "music/The1975-About You.mp3",
    "music/Paramore-TheOnlyException.mp3",
    "music/FromEden-Hozier.mp3",
  ];

  
  List<String> pics = const [
    "assets/img/hozier.jpg", 
    "assets/img/florence.jpg", 
    "assets/img/hozier.jpg", 
    "assets/img/1975.jpg", 
    "assets/img/paramore.jpeg", 
    "assets/img/hozier.jpg", 
  ];
  

  Future<void> _playSong(int index) async {
    try {
      await _audioPlayer.stop();

      if (index >= 0 && index < songs.length) {
        await _audioPlayer.play(AssetSource(songs[index]));
        
        setState(() {
          _currentIndex = index;
          _isPlaying = true;
          _isFirstPlay = false; 
        });
      }
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  Future<void> _togglePlayPause() async {
    try {
      if (_isPlaying) {
        
        await _audioPlayer.pause();
      } else {
        if (_isFirstPlay) {
        
          await _playSong(_currentIndex);
          
          return;
        } else {
      
          await _audioPlayer.resume();
        }
      }
      
      setState(() {
        _isPlaying = !_isPlaying;
      });
    } catch (e) {
      print("Error toggling play/pause: $e");
    }
  }
  
  void _nextSong() {
    int nextIndex = (_currentIndex + 1) % songs.length;
    _playSong(nextIndex);
  }

  void _prevSong() {
    int prevIndex = (_currentIndex - 1 + songs.length) % songs.length;
    _playSong(prevIndex);
  }

  void _shuffleSong() {
    int randomIndex = Random().nextInt(songs.length);
    _playSong(randomIndex);
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentSong = songs[_currentIndex].split("/").last;
    String currentImagePath = pics[_currentIndex]; 

    return Scaffold(
  body: Stack(
    children: [
      Container( 
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration( 
          image: DecorationImage(
           
            image: AssetImage('assets/img/download.jpeg'), 
            fit: BoxFit.cover, 
          ),
        ),
      ),

      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), 
          child: Container(

            color: Colors.black.withOpacity(0.2), 
          ),
        ),
      ),
        SafeArea( 
          child: Padding(
            padding: const EdgeInsets.all(24.0), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button 
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); 
                      },
                      icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255))),
              
                    Text(
                      "P L A Y L I S T".toUpperCase(),
                      style: getTitleTextStyle(context).copyWith(fontSize: 25), 
                    ),
                
                    // Playlist Button
                    IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.favorite, color: Color.fromARGB(255, 255, 255, 255))),
              
                  ],
                ),
                

                const SizedBox(height: 150),

                // Pic art
                ClipRRect( 
                  borderRadius: BorderRadius.circular(20.0), 
                  child: Image.asset(
                    currentImagePath, 
                    width: 300, 
                    height: 300,
                    fit: BoxFit.cover, 
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Song Name
                Text(
                  currentSong,
                  style: const TextStyle(
                    fontSize: 22, 
                    fontWeight: FontWeight.w900, 
                    color: Color.fromARGB(255, 255, 255, 255), 
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Controls Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.library_music, color: Color.fromARGB(255, 255, 255, 255)),
                      iconSize: 40,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SongListPage(
                              songs: songs,
                              onSongSelected: (index) {
                                Navigator.pop(context);
                                _playSong(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),

                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      iconSize: 40,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      onPressed: _prevSong,
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause_circle : Icons.play_circle,
                      ),
                      iconSize: 55,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      onPressed: _togglePlayPause,
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      iconSize: 40,
                      color: const Color.fromARGB(255, 250, 250, 250),
                      onPressed: _nextSong,
                    ),
                    const SizedBox(height: 100),
                    IconButton(
                  
                      icon: const Icon(Icons.shuffle),
                      iconSize: 35,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      onPressed: _shuffleSong,
                    ),
                  ],
                ),
                
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}

class SongListPage extends StatelessWidget {
  final List<String> songs;
  final Function(int) onSongSelected;

  const SongListPage({
    super.key,
    required this.songs,
    required this.onSongSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Song List")),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          String songName = songs[index].split("/").last;
          return ListTile(
            title: Text(songName),
            onTap: () => onSongSelected(index),
          );
        },
      ),
    );
  }
}