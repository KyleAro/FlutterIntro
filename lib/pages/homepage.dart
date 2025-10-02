import 'package:flutter/material.dart';
import '../styles/homepage_style.dart';
import '../pages/activity1_page.dart';
import '../pages/activity2_page.dart';
import '../pages/activity3_page.dart';
import '../pages/activity4_page.dart';

class MyActivityBody extends StatelessWidget {
  const MyActivityBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: customAppBarTheme.backgroundColor,
        title: Center(
          child: Text(
            (isMobile ? 'Aro Activity Mobile' : 'Aro Activity Desktop').toUpperCase(),
            style: getTitleTextStylez(context).copyWith(fontSize: 25),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: const Color.fromARGB(255, 240, 238, 238),
          onPressed: () {
            // Handle menu button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            color: const Color.fromARGB(255, 240, 238, 238),
            onPressed: () {
              //  favorite button press
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          children: <Widget>[
            // Music Player
            SizedBox(
              width: isMobile ? 400.0 : 500.0,  
              height: 200.0,
              child: buttons(
                context, 
                Icons.music_note, 
                'Music Player'.toUpperCase(), 
                ActivityPage(title: 'Music Player'.toUpperCase())
              ),
            ),
            SizedBox(height: 20.0),
            // Act 2
            SizedBox(
              width: isMobile ? 400.0 : 500.0,  
              height: 200.0,
              child: buttons(
                context, 
                Icons.account_circle_outlined, 
                'Activity Two'.toUpperCase(), 
                ActivityPage2(title: 'Activity 2')
              ),
            ),
            SizedBox(height: 20.0),
        // Act 3
            SizedBox(
              width: isMobile ? 400.0 : 500.0,  
              height: 200.0,
              child: buttons(
                context, 
                Icons.add_circle_outline_outlined, 
                'Activity Three'.toUpperCase(), 
                ActivityPage3(title: 'Activity 3')
              ),
            ),
            SizedBox(height: 20.0),

             // Act 4
            SizedBox(
              width: isMobile ? 400.0 : 500.0,  
              height: 200.0,
              child: buttons(
                context, 
                Icons.adjust, 
                'Activity Four'.toUpperCase(), 
                ActivityPage4(title: 'Activity 4')
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget buttons(BuildContext context, IconData icon, String label, Widget page) {
    final screenWidth = MediaQuery.of(context).size.width;

    double iconSize = screenWidth < 600 ? 50 : 70;  
    double fontSize = screenWidth < 600 ? 18 : 22;  

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(141, 11, 11, 12).withOpacity(1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Color.fromARGB(118, 208, 211, 214),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(-4, -4),
          ),
        ],
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 39, 76),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Transform.translate(
                offset: const Offset(10.0, 0), 
                child: Icon(
                  icon,
                  size: iconSize,
                  color: const Color.fromARGB(255, 236, 235, 233),
                ),
              ),
              Transform.translate(
                offset: const Offset(10, 0), 
                child: Text(
                  label,
                  style: getTitleTextStylez(context).copyWith(
                    fontSize: fontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
