import 'package:flutter/material.dart';


class ActivityPage4 extends StatelessWidget{
  final String title;

  const ActivityPage4({super.key,required this.title});



  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 165, 163),
      appBar: AppBar(title: Text(title)),
      body:const Center(child: Text('Activity 4 is Under Developed.'),
      ),
    );
  }
}