// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeInUp extends StatelessWidget {
  final int delay;
  final Widget child;

  const FadeInUp(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final _tween = MovieTween()
      ..tween(AniProps.opacity, Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween(AniProps.translateY, Tween(begin: 24.0, end: 0.0),
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (50.0 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, animation, child) {
        return Opacity(
          opacity: animation.get(AniProps.opacity),
          child: Transform.translate(
            offset: Offset(0.0, animation.get(AniProps.translateY)),
            child: child,
          ),
        );
      },
    );
  }
}
