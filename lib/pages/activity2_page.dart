import 'package:flutter/material.dart';


class ActivityPage2 extends StatelessWidget{
  final String title;

  const ActivityPage2({super.key,required this.title});



  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 122, 170),
      appBar: AppBar(title: Text(title)),
      body:const Center(child: Text('Activity 2 is Under Developed.'),
      ),
    );
  }
}