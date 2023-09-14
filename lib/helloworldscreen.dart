import 'dart:math';

import 'package:flutter/material.dart';

class Helloworldscreen extends StatefulWidget {
  const Helloworldscreen({ Key? key }) : super(key: key);

  @override
  _HelloworldscreenState createState() => _HelloworldscreenState();
}

class _HelloworldscreenState extends State<Helloworldscreen> with SingleTickerProviderStateMixin {
  Color backgroundColor = Colors.white;
  late AnimationController animationController;
  late Animation<Color?> colorTween;
 
@override
  void initState() {
    super.initState();

    // Initialize the animation controller
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000), // Animation duration
      vsync: this,
    );
    // Initialize the color tween
    colorTween = ColorTween(
      begin: backgroundColor,
      end: backgroundColor,
    ).animate(animationController);
  }
  void changeBackgroundColor(){
     const int max = 256;
     const double opacity =0.1;
      
        final random = Random();
        final newColor = Color.fromRGBO(random.nextInt(max),
         random.nextInt(max), random.nextInt(max), opacity);

         setState(() {
            colorTween = ColorTween(
        begin: backgroundColor,
        end: newColor,
      ).animate(animationController);
      animationController.forward(from: 0.0);
      backgroundColor = newColor;
    });
        
        
      
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      child: AnimatedBuilder(
          animation: colorTween,
          builder: (context, child) {
            return Container(
              color: colorTween.value, // Set the background color
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
            },
        ),
      
    );
  }
 @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
