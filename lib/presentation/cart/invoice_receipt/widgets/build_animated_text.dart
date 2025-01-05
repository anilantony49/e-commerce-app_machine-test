import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce_app/core/utils/text.dart';
import 'package:flutter/material.dart';

Widget buildAnimatedText() {
  return AnimatedTextKit(
    animatedTexts: [
      ColorizeAnimatedText(
        AppText.billedSuccessfully,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        colors: [
          Colors.green,
          Colors.blue,
          Colors.orange,
          Colors.purple,
        ],
      ),
    ],
    isRepeatingAnimation: true,
    repeatForever: true,
  );
}
