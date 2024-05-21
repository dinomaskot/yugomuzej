import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';

class CustomInkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onHover;
  final Widget child;

  const CustomInkWell({
    super.key,
    this.onTap,
    this.onHover,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (h) {
        if (h) Globals.onHoverSound.play();
      },
      child: child,
    );
  }
}
