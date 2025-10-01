import 'package:flutter/material.dart';
import '../styles/homepage_style.dart';
import '../pages/activity1_page.dart';
import '../pages/activity2_page.dart';
import '../pages/activity3_page.dart';
import '../pages/activity4_page.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: customAppBarTheme.backgroundColor,
        title: Center(
          child: Text(
            'Aro Activity Mobile'.toUpperCase(),
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
              // Handle favorite button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          children: <Widget>[
            SizedBox(
              width: 400.0,
              height: 200.0,
              child: buttons(context, Icons.music_note, 'Music Player'.toUpperCase(), ActivityPage(title: 'Music Player'.toUpperCase())),
            ),
            SizedBox(height: 20.0),

            SizedBox(
              width: 400.0,
              height: 200.0,
              child: buttons(context, Icons.account_circle_outlined, 'Activity Two'.toUpperCase(), ActivityPage2(title: 'Activity 2')),
            ),
            SizedBox(height: 20.0),

            SizedBox(
              width: 400.0,
              height: 200.0,
              child: buttons(context, Icons.add_circle_outline_outlined, 'Activity Three'.toUpperCase(), ActivityPage3(title: 'Activity 3')),
            ),
            SizedBox(height: 20.0),

            SizedBox(
              width: 400.0,
              height: 200.0,
              child: buttons(context, Icons.adjust, 'Activity Four'.toUpperCase(), ActivityPage4(title: 'Activity 4')),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttons(BuildContext context, IconData icon, String label, Widget page) {
  final screenWidth = MediaQuery.of(context).size.width;

  double iconSize = screenWidth < 500 ? 50 : 70;
  double fontSize = screenWidth < 500 ? 18 : 22;

  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 31, 30, 31).withOpacity(1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(4, 4),
        ),
        const BoxShadow(
          color: Color.fromARGB(74, 148, 148, 143),
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
          mainAxisSize: MainAxisSize.min,
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
              offset: const Offset(10,0), 
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

