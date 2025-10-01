import 'package:flutter/material.dart';
import '../styles/musicplayer_style.dart'; 
import 'package:genesis/responsive/responsive_layout.dart';
import 'act_1responsive/act_1mobile.dart';
import 'act_1responsive/act_1desktop.dart';

class ActivityPage extends StatelessWidget {
  final String title;

  const ActivityPage({super.key, required this.title});


   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: scaffoldBackgroundColor,  
        
        body: ResponsiveLayout(
          mobileBody: Act_1Mobile(),  
          desktopBody: Act_1Desktop(),  
        ),
           ),
    
    );
  }
}
