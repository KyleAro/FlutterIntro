import 'package:flutter/material.dart';
import '../styles/musicplayer_style.dart'; 


class ActivityPage extends StatelessWidget {
  final String title;

  const ActivityPage({super.key, required this.title});

  @override
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: scaffoldBackgroundColor,  
        appBar: AppBar(
          backgroundColor: customAppBarTheme.backgroundColor,  
          title: Center(
            child: Text(
              'music player'.toUpperCase(),
              style: getTitleTextStyle(context).copyWith(fontSize: 16,)
              
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(255, 255, 203, 59),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              color: const Color.fromARGB(255, 255, 203, 59),
              onPressed: () {
                // Handle favorite button press
              },
            ),
          ],
        ), 
           ),
         
    );
  }
}
