import 'package:flutter/material.dart';
import '../../styles/musicplayer_style.dart';


class Act_1Desktop extends StatelessWidget {
  const Act_1Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            'This is the desktop body',
            style: getTitleTextStyle(context).copyWith(fontSize: 30),
        ),
      ),
      ),
      );

  }   
  }