import 'package:flutter/material.dart';

class ImageWithGradient extends StatelessWidget {
  final List<String> onboardingImages;
  final int index;
  const ImageWithGradient({
    super.key,
    required this.onboardingImages,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(240, 0, 0, 0),
            Colors.black87,
            Colors.black54,
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.2, 0.35, 0.46, 0.55],
        ),
      ),
      child: Image.asset(
        onboardingImages[index],
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
