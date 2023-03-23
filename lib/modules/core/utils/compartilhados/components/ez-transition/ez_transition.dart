// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class EzTransition extends StatefulWidget {
  /// Este Widget foi adquirido do repositório do pacote EZ-Flutter.
  ///
  /// Recurso encontrado nesse link:
  ///
  /// https://github.com/Ephenodrom/EZ-Flutter/blob/master/lib/src/widgets/EzTransition.dart
  ///
  /// E pacote completo encontrado nesse link:
  ///
  /// https://github.com/Ephenodrom/EZ-Flutter
  ///
  /// Creditado a @Ephenodrom
  ///
  /// Widget for displaying loading animation and doing background work at the same time.
  const EzTransition(
      {super.key,
      required this.child,
      required this.toProcess,
      this.backgroundColor});

  final Function() toProcess;
  final Widget child;
  final Color? backgroundColor;

  @override
  _EzTransitionState createState() => _EzTransitionState();
}

class _EzTransitionState extends State<EzTransition> {
  @override
  void initState() {
    super.initState();
    widget.toProcess();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Color? getBackgroundColor() {
    return widget.backgroundColor ?? Theme.of(context).colorScheme.background;
  }
}
