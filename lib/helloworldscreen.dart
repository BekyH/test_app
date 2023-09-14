import 'dart:math';

import 'package:flutter/material.dart';

class Helloworldscreen extends StatefulWidget {
  const Helloworldscreen({ Key? key }) : super(key: key);

  @override
  _HelloworldscreenState createState() => _HelloworldscreenState();
}

class _HelloworldscreenState extends State<Helloworldscreen> {
  Color backgroundColor = Colors.white;
  
 

  void changeBackgroundColor(){
     const int max = 256;
     const double opacity =0.1;
      setState(() {
        final random = Random();
        backgroundColor = Color.fromRGBO(random.nextInt(max),
         random.nextInt(max), random.nextInt(max), opacity);
        
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor
        ),
        child: Center(
        child: Text('Hello,world'),
      ),
      )
      
    );
  }
}