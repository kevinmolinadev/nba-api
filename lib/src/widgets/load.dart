import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Load extends StatelessWidget {
  const Load({super.key});
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
        color: const Color.fromARGB(255, 51, 138, 209), size: 100);
  }
}
