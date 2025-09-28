import 'package:flutter/material.dart';
import '../styles/homepage_style.dart'; 

import '../responsive/desktop_body.dart';
import '../responsive/mobile_body.dart';
import '../responsive/responsive_layout.dart';  

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: scaffoldBackgroundColor,  
        body: ResponsiveLayout(
          mobileBody: MyMobileBody(),  
          desktopBody: MyDesktopBody(),  
        ),
      ),
    );
  } 
}

