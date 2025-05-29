import 'package:flutter/material.dart';

class OnLandingCards extends StatelessWidget {
  const OnLandingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set a fixed height for the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        physics: BouncingScrollPhysics(), // Bouncing effect
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            margin: EdgeInsets.all(8.0),
            color: index.isEven ? Colors.red : Colors.green,
          );
        },
      ),
    );
  }
}
