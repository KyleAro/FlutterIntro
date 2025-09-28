import 'package:flutter/material.dart';


class ActivityPage3 extends StatelessWidget{
  final String title;

  const ActivityPage3({super.key,required this.title});



  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 168, 106),
      appBar: AppBar(title: Text(title)),
      body:const Center(child: Text('Activity 3 is Under Developed.'),
      ),
    );
  }
}