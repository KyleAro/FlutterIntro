import 'package:flutter/material.dart';
import '../../styles/musicplayer_style.dart';


class Act_1Mobile extends StatelessWidget {
  const Act_1Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
  
      body: Column  (
        children: [
          Row(
            // back button
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.arrow_back),
              ),

            // Playlist title
            Text(
              'Playlist'.toUpperCase(),
              style: getTitleTextStyle(context).copyWith(fontSize: 25),
              ),
            //favorite button 
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.favorite),
              ),
                 ],    
          ),
        ],
        
      ),
    );
  }   
  }